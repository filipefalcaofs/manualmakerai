#!/usr/bin/env python3
"""
Scraper para o Manual do MakerAI (manual.softwell.com.br)
Extrai todo o conteúdo da documentação e salva em arquivos Markdown organizados.
"""

import os
import re
import time
import xml.etree.ElementTree as ET
from urllib.parse import urlparse, urljoin

import requests
from bs4 import BeautifulSoup
from markdownify import markdownify as md

BASE_URL = "https://manual.softwell.com.br"
SITEMAP_URL = f"{BASE_URL}/sitemap.xml"
DOCS_PREFIX = "/docs/"
OUTPUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "manual_scraped")
DELAY = 1  # seconds between requests to be polite

SESSION = requests.Session()
SESSION.headers.update({
    "User-Agent": "MakerAI-Manual-Scraper/1.0 (educational purpose)"
})


def fetch_sitemap_urls():
    """Fetch all doc URLs from sitemap.xml."""
    print("[1/4] Buscando sitemap.xml...")
    resp = SESSION.get(SITEMAP_URL, timeout=30)
    resp.raise_for_status()

    # Parse XML - remove namespace for easier parsing
    content = resp.text
    content = re.sub(r'\sxmlns="[^"]+"', '', content, count=1)
    root = ET.fromstring(content)

    urls = []
    for url_elem in root.findall(".//url/loc"):
        raw_url = url_elem.text.strip()
        # The sitemap may use a different domain; normalize to BASE_URL
        parsed = urlparse(raw_url)
        path = parsed.path
        if path.startswith("/docs/") or path == "/docs":
            normalized = BASE_URL + path
            urls.append(normalized)

    print(f"   Encontradas {len(urls)} páginas de documentação no sitemap.")
    return urls


def discover_sidebar_links(start_url):
    """Fallback: crawl the sidebar to discover all doc pages."""
    print("[1/4] Sitemap insuficiente, descobrindo links via sidebar...")
    resp = SESSION.get(start_url, timeout=30)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "lxml")

    urls = set()
    # Docusaurus sidebar links
    for a_tag in soup.select("nav a[href], .menu a[href], aside a[href]"):
        href = a_tag.get("href", "")
        if href.startswith("/docs/"):
            full_url = BASE_URL + href.split("#")[0]
            urls.add(full_url)

    # Also check the main content for links
    for a_tag in soup.select("article a[href], main a[href]"):
        href = a_tag.get("href", "")
        if href.startswith("/docs/"):
            full_url = BASE_URL + href.split("#")[0]
            urls.add(full_url)

    urls.add(start_url)
    print(f"   Encontradas {len(urls)} páginas via sidebar/links.")
    return sorted(urls)


def crawl_all_links(seed_urls, max_depth=3):
    """BFS crawl starting from seed URLs to discover all /docs/ pages."""
    print("[2/4] Descobrindo todas as páginas via crawling...")
    visited = set()
    to_visit = list(seed_urls)
    all_urls = set(seed_urls)

    depth = 0
    while to_visit and depth < max_depth:
        next_level = []
        for url in to_visit:
            if url in visited:
                continue
            visited.add(url)
            try:
                resp = SESSION.get(url, timeout=30)
                resp.raise_for_status()
                soup = BeautifulSoup(resp.text, "lxml")
                for a_tag in soup.find_all("a", href=True):
                    href = a_tag["href"]
                    # Handle relative URLs
                    if href.startswith("/docs/"):
                        full_url = BASE_URL + href.split("#")[0].rstrip("/")
                        if full_url not in all_urls:
                            all_urls.add(full_url)
                            next_level.append(full_url)
                    elif href.startswith(BASE_URL + "/docs/"):
                        clean = href.split("#")[0].rstrip("/")
                        if clean not in all_urls:
                            all_urls.add(clean)
                            next_level.append(clean)
                time.sleep(0.5)
            except Exception as e:
                print(f"   ⚠ Erro ao acessar {url}: {e}")

        to_visit = next_level
        depth += 1
        print(f"   Profundidade {depth}: {len(next_level)} novos links encontrados (total: {len(all_urls)})")

    print(f"   Total final: {len(all_urls)} páginas encontradas.")
    return sorted(all_urls)


def extract_page_content(url):
    """Fetch a page and extract the main documentation content as Markdown."""
    resp = SESSION.get(url, timeout=30)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "lxml")

    # Get the page title
    title = ""
    title_tag = soup.find("h1")
    if title_tag:
        title = title_tag.get_text(strip=True)

    # Docusaurus main content area
    content_area = (
        soup.select_one("article") or
        soup.select_one(".markdown") or
        soup.select_one("main") or
        soup.select_one('[class*="docMainContainer"]')
    )

    if not content_area:
        return title, ""

    # Remove navigation elements, footer, TOC sidebar
    for selector in [
        "nav", "footer", ".pagination-nav", ".table-of-contents",
        ".theme-doc-toc-mobile", ".theme-doc-toc-desktop",
        '[class*="tocCollapsible"]', ".breadcrumbs", ".theme-doc-breadcrumbs",
        "button", '[class*="copyButton"]', ".hash-link"
    ]:
        for elem in content_area.select(selector):
            elem.decompose()

    # Convert to Markdown
    markdown_content = md(
        str(content_area),
        heading_style="ATX",
        bullets="-",
        strip=["script", "style", "button"],
        code_language_callback=lambda el: el.get("class", [""])[0].replace("language-", "") if el.get("class") else ""
    )

    # Clean up excessive whitespace
    markdown_content = re.sub(r'\n{3,}', '\n\n', markdown_content)
    markdown_content = markdown_content.strip()

    return title, markdown_content


def url_to_filepath(url):
    """Convert a URL to a local file path."""
    parsed = urlparse(url)
    path = parsed.path

    # Remove /docs/ prefix
    if path.startswith("/docs/"):
        path = path[len("/docs/"):]
    elif path == "/docs":
        path = "intro"

    # Clean up
    path = path.strip("/")
    if not path:
        path = "intro"

    # Replace slashes with directory separators
    filepath = os.path.join(OUTPUT_DIR, path + ".md")
    return filepath


def save_content(filepath, title, content, url):
    """Save the page content to a Markdown file."""
    os.makedirs(os.path.dirname(filepath), exist_ok=True)

    header = f"# {title}\n\n" if title else ""
    source = f"> Fonte: {url}\n\n"

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(header)
        f.write(source)
        f.write(content)
        f.write("\n")


def create_index(scraped_pages):
    """Create an index file listing all scraped pages."""
    index_path = os.path.join(OUTPUT_DIR, "INDEX.md")
    with open(index_path, "w", encoding="utf-8") as f:
        f.write("# Manual MakerAI - Índice\n\n")
        f.write(f"Total de páginas raspadas: **{len(scraped_pages)}**\n\n")
        f.write("| # | Título | Arquivo |\n")
        f.write("|---|--------|--------|\n")
        for i, (title, filepath, url) in enumerate(scraped_pages, 1):
            rel_path = os.path.relpath(filepath, OUTPUT_DIR)
            f.write(f"| {i} | {title or 'Sem título'} | [{rel_path}]({rel_path}) |\n")

    print(f"\n   Índice salvo em: {index_path}")


def main():
    print("=" * 60)
    print("  Scraper do Manual MakerAI")
    print("  manual.softwell.com.br/docs")
    print("=" * 60)
    print()

    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # Step 1: Discover URLs from sitemap
    sitemap_urls = fetch_sitemap_urls()

    # Step 2: If sitemap didn't find enough, crawl
    if len(sitemap_urls) < 5:
        sidebar_urls = discover_sidebar_links(f"{BASE_URL}/docs/intro")
        seed_urls = set(sitemap_urls) | set(sidebar_urls)
        seed_urls.add(f"{BASE_URL}/docs/intro")
        all_urls = crawl_all_links(seed_urls)
    else:
        # Even with sitemap, do a shallow crawl to catch any missing pages
        all_urls = crawl_all_links(sitemap_urls, max_depth=1)

    # Step 3: Scrape each page
    print(f"\n[3/4] Raspando {len(all_urls)} páginas...")
    scraped_pages = []
    errors = []

    for i, url in enumerate(all_urls, 1):
        try:
            print(f"   [{i}/{len(all_urls)}] {url}")
            title, content = extract_page_content(url)
            if content:
                filepath = url_to_filepath(url)
                save_content(filepath, title, content, url)
                scraped_pages.append((title, filepath, url))
            else:
                print(f"      ⚠ Página sem conteúdo, pulando.")
            time.sleep(DELAY)
        except Exception as e:
            errors.append((url, str(e)))
            print(f"      ❌ Erro: {e}")

    # Step 4: Create index
    print(f"\n[4/4] Criando índice...")
    create_index(scraped_pages)

    # Summary
    print("\n" + "=" * 60)
    print(f"  ✅ Raspagem concluída!")
    print(f"  Páginas raspadas: {len(scraped_pages)}")
    print(f"  Erros: {len(errors)}")
    print(f"  Diretório de saída: {OUTPUT_DIR}")
    print("=" * 60)

    if errors:
        print("\nPáginas com erro:")
        for url, err in errors:
            print(f"  - {url}: {err}")


if __name__ == "__main__":
    main()

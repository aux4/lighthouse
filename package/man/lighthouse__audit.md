#### Description

The `audit` command runs a full Google Lighthouse audit on the specified URL and displays the category scores. By default it emulates a mobile device. Use `--preset desktop` for desktop scores.

Categories scored:
- **performance** — Loading speed, interactivity, visual stability
- **accessibility** — WCAG compliance, ARIA usage, contrast ratios
- **best-practices** — HTTPS, console errors, deprecated APIs
- **seo** — Meta tags, crawlability, structured data

Use `--categories` to run only specific categories for faster results.

#### Usage

```bash
aux4 lighthouse audit <url> [--preset <mobile|desktop>] [--categories <list>]
```

url           URL to audit
--preset      Device preset: mobile (default) or desktop
--categories  Comma-separated categories to audit (e.g. performance,seo)

#### Example

```bash
aux4 lighthouse audit https://example.com
```

```text
Lighthouse audit for https://example.com

  performance: 95
  accessibility: 100
  best-practices: 96
  seo: 92
```

Desktop audit with specific categories:

```bash
aux4 lighthouse audit https://example.com --preset desktop --categories performance,seo
```

```text
Lighthouse audit for https://example.com

  performance: 98
  seo: 92
```

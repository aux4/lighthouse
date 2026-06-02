#### Description

The `audit` command runs a full Google Lighthouse audit on the specified URL and displays the category scores along with any failing audits. By default it emulates a mobile device. Use `--preset desktop` for desktop scores.

Categories scored:
- **performance** — Loading speed, interactivity, visual stability
- **accessibility** — WCAG compliance, ARIA usage, contrast ratios
- **best-practices** — HTTPS, console errors, deprecated APIs
- **seo** — Meta tags, crawlability, structured data

Failing audits are listed under each category, so you can immediately see why a score is low without needing to generate a full report.

Use `--category` to run only specific categories for faster results.

#### Usage

```bash
aux4 lighthouse audit <url> [--preset <mobile|desktop>] [--category <list>]
```

url          URL to audit
--preset     Device preset: mobile (default) or desktop
--category   Comma-separated categories to audit (e.g. performance,seo)

#### Example

```bash
aux4 lighthouse audit https://example.com
```

```text
Lighthouse audit for https://example.com

  performance: 95
  accessibility: 100
  best-practices: 96
  seo: 61
    ✗ Page is blocked from indexing
    ✗ Links do not have descriptive text
```

Desktop audit with specific category:

```bash
aux4 lighthouse audit https://example.com --preset desktop --category seo
```

```text
Lighthouse audit for https://example.com

  seo: 61
    ✗ Page is blocked from indexing
    ✗ Links do not have descriptive text
```

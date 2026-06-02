# aux4/lighthouse

Run Google Lighthouse audits from the command line

This package wraps the [Lighthouse](https://developer.chrome.com/docs/lighthouse/) CLI to run performance, accessibility, SEO, and best-practices audits on any URL. Get quick scores with diagnostics, generate HTML/JSON/CSV reports, and integrate audits into scripts and CI pipelines.

## Installation

```bash
aux4 aux4 pkger install aux4/lighthouse
```

## Quick Start

Run a full audit with diagnostics:

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

Get scores as JSON:

```bash
aux4 lighthouse scores https://example.com
```

```json
{
  "url": "https://example.com",
  "scores": {
    "performance": 95,
    "accessibility": 100,
    "best-practices": 96,
    "seo": 61
  }
}
```

Get scores with failure details:

```bash
aux4 lighthouse scores https://example.com --details true
```

```json
{
  "url": "https://example.com",
  "scores": { "performance": 95, "seo": 61 },
  "failures": {
    "seo": [
      { "id": "is-crawlable", "title": "Page is blocked from indexing" },
      { "id": "link-text", "title": "Links do not have descriptive text" }
    ]
  }
}
```

Save an HTML report:

```bash
aux4 lighthouse report https://example.com --output my-report
```

## Audit — display scores with diagnostics

Run a full Lighthouse audit and display the category scores. Failing audits are listed under each category so you can immediately see why a score is low:

```bash
aux4 lighthouse audit https://example.com
```

Desktop mode:

```bash
aux4 lighthouse audit https://example.com --preset desktop
```

Specific category only:

```bash
aux4 lighthouse audit https://example.com --category seo
```

## Report — save to file

Generate and save a report file:

```bash
# HTML report (default)
aux4 lighthouse report https://example.com

# JSON report
aux4 lighthouse report https://example.com --format json

# Both HTML and JSON
aux4 lighthouse report https://example.com --format html,json --output ./reports/my-site

# Desktop preset
aux4 lighthouse report https://example.com --format html --preset desktop

# Specific categories
aux4 lighthouse report https://example.com --format json --category performance,seo
```

## Scores — JSON output

Get just the scores as JSON for scripting:

```bash
aux4 lighthouse scores https://example.com
```

With failure details for diagnostics:

```bash
aux4 lighthouse scores https://example.com --details true
```

Pipe to jq for specific scores:

```bash
aux4 lighthouse scores https://example.com | jq '.scores.performance'
```

Compare mobile vs desktop:

```bash
echo "Mobile:"
aux4 lighthouse scores https://example.com
echo "Desktop:"
aux4 lighthouse scores https://example.com --preset desktop
```

## Options

All commands support these options:

- `--preset` — `mobile` (default) or `desktop`
- `--category` — Comma-separated list of categories to audit: `performance`, `accessibility`, `best-practices`, `seo`

The `scores` command also supports:

- `--details` — `true` or `false` (default). When true, includes failing audits per category in the JSON output.

## CI/CD Integration

Use the `scores` command in CI to enforce thresholds:

```bash
PERF=$(aux4 lighthouse scores https://example.com | jq '.scores.performance')
if [ "$PERF" -lt 80 ]; then
  echo "Performance score $PERF is below threshold 80"
  exit 1
fi
```

## License

MIT — See [LICENSE](./LICENSE) for details.

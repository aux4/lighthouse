# aux4/lighthouse

Run Google Lighthouse audits from the command line

This package wraps the [Lighthouse](https://developer.chrome.com/docs/lighthouse/) CLI to run performance, accessibility, SEO, and best-practices audits on any URL. Get quick scores, generate HTML/JSON/CSV reports, and integrate audits into scripts and CI pipelines.

## Installation

```bash
aux4 aux4 pkger install aux4/lighthouse
```

## System Dependencies

This package requires Lighthouse CLI. It will be installed automatically via npm:

```bash
npm install -g lighthouse
```

Lighthouse also requires a Chrome/Chromium browser. It uses the system Chrome by default. If Chrome is not installed, set the `CHROME_PATH` environment variable to a Chromium binary (e.g. from Playwright).

## Quick Start

Run a full audit:

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
    "seo": 92
  }
}
```

Save an HTML report:

```bash
aux4 lighthouse report https://example.com --output my-report
```

## Audit — display scores

Run a full Lighthouse audit and display the category scores:

```bash
aux4 lighthouse audit https://example.com
```

Desktop mode:

```bash
aux4 lighthouse audit https://example.com --preset desktop
```

Specific categories only:

```bash
aux4 lighthouse audit https://example.com --categories performance,seo
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
```

## Scores — JSON output

Get just the scores as JSON for scripting:

```bash
aux4 lighthouse scores https://example.com
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
- `--categories` — Comma-separated list of categories to audit: `performance`, `accessibility`, `best-practices`, `seo`

## CI/CD Integration

Use the `scores` command in CI to enforce thresholds:

```bash
PERF=$(aux4 lighthouse scores https://example.com | jq '.scores.performance')
if [ "$PERF" -lt 80 ]; then
  echo "Performance score $PERF is below threshold 80"
  exit 1
fi
```

## Environment Variables

- `CHROME_PATH` — Path to Chrome/Chromium binary (overrides auto-detection)

## License

MIT — See [LICENSE](./LICENSE) for details.

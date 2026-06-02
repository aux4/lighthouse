#### Description

The `scores` command runs a Lighthouse audit and returns the scores as a JSON object. This is designed for scripting, CI pipelines, and programmatic access to audit results.

Scores are integers from 0 to 100. The output includes the requested URL and a `scores` object with one key per category.

Use `--details true` to include the list of failing audits per category in the output. This lets agents and scripts diagnose low scores without running a separate full audit.

Use `--category` to run only specific categories for faster results.

#### Usage

```bash
aux4 lighthouse scores <url> [--preset <mobile|desktop>] [--category <list>] [--details <true|false>]
```

url          URL to audit
--preset     Device preset: mobile (default) or desktop
--category   Comma-separated categories to audit (e.g. performance,seo)
--details    Include failing audits in output (default: false)

#### Example

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

With details:

```bash
aux4 lighthouse scores https://example.com --details true
```

```json
{
  "url": "https://example.com",
  "scores": {
    "performance": 95,
    "accessibility": 100,
    "best-practices": 96,
    "seo": 61
  },
  "failures": {
    "seo": [
      { "id": "is-crawlable", "title": "Page is blocked from indexing" },
      { "id": "link-text", "title": "Links do not have descriptive text" }
    ]
  }
}
```

Extract a single score:

```bash
aux4 lighthouse scores https://example.com | jq '.scores.performance'
```

CI threshold check:

```bash
SCORE=$(aux4 lighthouse scores https://example.com | jq '.scores.performance')
[ "$SCORE" -ge 80 ] || exit 1
```

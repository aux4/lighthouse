#### Description

The `scores` command runs a Lighthouse audit and returns the scores as a JSON object. This is designed for scripting, CI pipelines, and programmatic access to audit results.

Scores are integers from 0 to 100. The output includes the requested URL and a `scores` object with one key per category.

#### Usage

```bash
aux4 lighthouse scores <url> [--preset <mobile|desktop>] [--categories <list>]
```

url           URL to audit
--preset      Device preset: mobile (default) or desktop
--categories  Comma-separated categories to audit

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
    "seo": 92
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

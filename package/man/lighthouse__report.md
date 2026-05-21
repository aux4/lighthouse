#### Description

The `report` command runs a Lighthouse audit and saves the results to a file. Supports HTML, JSON, and CSV formats. You can generate multiple formats at once.

The HTML report is a self-contained interactive page with detailed audit results, screenshots, and recommendations. The JSON report contains the full raw data for programmatic processing.

#### Usage

```bash
aux4 lighthouse report <url> [--output <path>] [--format <formats>] [--preset <mobile|desktop>] [--categories <list>]
```

url           URL to audit
--output      Output file path without extension (default: lighthouse-report)
--format      Report format: html (default), json, csv, or html,json for both
--preset      Device preset: mobile (default) or desktop
--categories  Comma-separated categories to audit

#### Example

```bash
aux4 lighthouse report https://example.com
```

Generates `lighthouse-report.report.html` in the current directory.

```bash
aux4 lighthouse report https://example.com --format html,json --output ./reports/my-site
```

Generates `./reports/my-site.report.html` and `./reports/my-site.report.json`.

```bash
aux4 lighthouse report https://example.com --format json --preset desktop
```

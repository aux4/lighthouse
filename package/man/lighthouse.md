#### Description

The `lighthouse` command group runs Google Lighthouse audits on web pages. It measures performance, accessibility, best practices, and SEO, providing scores, diagnostics, and detailed reports.

Available subcommands:

- **audit** — Run an audit and display scores with failing audits
- **report** — Run an audit and save HTML/JSON/CSV report
- **scores** — Run an audit and return scores as JSON (with optional failure details)

All subcommands support `--preset` (mobile/desktop) and `--category` (filter to specific categories).

#### Usage

```bash
aux4 lighthouse <subcommand>
```

#### Example

```bash
aux4 lighthouse audit https://example.com
aux4 lighthouse audit https://example.com --category seo
aux4 lighthouse scores https://example.com --details true
aux4 lighthouse report https://example.com --format html,json
```

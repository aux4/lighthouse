#### Description

The `lighthouse` command group runs Google Lighthouse audits on web pages. It measures performance, accessibility, best practices, and SEO, providing scores and detailed reports.

Available subcommands:

- **audit** — Run an audit and display scores
- **report** — Run an audit and save HTML/JSON/CSV report
- **scores** — Run an audit and return scores as JSON

#### Usage

```bash
aux4 lighthouse <subcommand>
```

#### Example

```bash
aux4 lighthouse audit https://example.com
aux4 lighthouse scores https://example.com --preset desktop
aux4 lighthouse report https://example.com --format html,json
```

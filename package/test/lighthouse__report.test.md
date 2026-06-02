# lighthouse report

```timeout
120000
```

```afterAll
rm -f /tmp/aux4-lh-test.report.html /tmp/aux4-lh-test.report.json
```

## generate html report

### should create an html report file

```execute
aux4 lighthouse report https://example.com --output /tmp/aux4-lh-test && test -f /tmp/aux4-lh-test.report.html && echo "report created"
```

```expect:partial
report created
```

## generate json report

```timeout
120000
```

### should create a json report file

```execute
rm -f /tmp/aux4-lh-test.report.json && aux4 lighthouse report https://example.com --format json --output /tmp/aux4-lh-test && test -f /tmp/aux4-lh-test.report.json && echo "report created"
```

```expect:partial
report created
```

## with category filter

```timeout
120000
```

### should create a report with specific category

```execute
rm -f /tmp/aux4-lh-test.report.html && aux4 lighthouse report https://example.com --category seo --output /tmp/aux4-lh-test && test -f /tmp/aux4-lh-test.report.html && echo "report created"
```

```expect:partial
report created
```

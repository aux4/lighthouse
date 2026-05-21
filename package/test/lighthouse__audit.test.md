# lighthouse audit

```timeout
120000
```

## with a valid URL

### should display scores

```execute
aux4 lighthouse audit https://example.com
```

```expect:partial
Lighthouse audit for https://example.com
```

```expect:partial
performance:
```

```expect:partial
seo:
```

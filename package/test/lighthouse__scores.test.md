# lighthouse scores

```timeout
120000
```

## with a valid URL

### should return JSON scores

```execute
aux4 lighthouse scores https://example.com
```

```expect:partial
"url"
```

```expect:partial
"scores"
```

```expect:partial
"performance"
```

## with details

```timeout
120000
```

### should include failures when details is true

```execute
aux4 lighthouse scores https://example.com --details true
```

```expect:partial
"scores"
```

```expect:partial
"failures"
```

## with category filter

```timeout
120000
```

### should only include the specified category

```execute
aux4 lighthouse scores https://example.com --category seo
```

```expect:partial
"seo"
```

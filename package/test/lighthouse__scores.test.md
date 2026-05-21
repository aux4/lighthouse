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

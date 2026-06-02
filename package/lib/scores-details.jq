{
  url: .requestedUrl,
  scores: (.categories | to_entries | map({key: .key, value: (.value.score * 100 | floor)}) | from_entries),
  failures: (
    . as $root |
    .categories | to_entries | map(
      {
        key: .key,
        value: [
          .value.auditRefs[] |
          .id as $id |
          $root.audits[$id] |
          select(
            .score != null and
            .score < 1 and
            .scoreDisplayMode != "manual" and
            .scoreDisplayMode != "informative" and
            .scoreDisplayMode != "notApplicable" and
            .scoreDisplayMode != "numeric"
          ) |
          {id: .id, title: .title}
        ]
      }
    ) | map(select(.value | length > 0)) | from_entries
  )
}

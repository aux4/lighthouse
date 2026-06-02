. as $root |
.categories | to_entries[] |
"  " + .key + ": " + (.value.score * 100 | floor | tostring),
(
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
  "    ✗ " + .title
)

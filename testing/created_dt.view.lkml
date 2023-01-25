view: created_dt {
derived_table: {
  sql: SELECT '1' as number
  UNION ALL SELECT '2' as number
  UNION ALL SELECT '-1' as number
  UNION ALL SELECT '-1.2' as number
  ;;
}

dimension: num {
  type: number
  sql: ${TABLE}.number ;;
}
}

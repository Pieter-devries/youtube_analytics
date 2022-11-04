view: new_lookml_always_filter_test {
  derived_table: {
    sql:
    select
    "test" as value
    ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
    suggest_persist_for: "0 second"
  }

  parameter: param {
    type: unquoted
    default_value: "choice"
    allowed_value: { value: "choice" }
  }
}

explore: new_lookml_always_filter_test {
  sql_always_where:
  true
  -- parameter_value: !{% parameter new_lookml_always_filter_test.param %}!
  ;;

  always_filter: {
    filters: [
      new_lookml_always_filter_test.param: "choice"
    ]
  }
}

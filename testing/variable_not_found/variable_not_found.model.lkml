connection: "looker-dcl-data"

view: orders {
  sql_table_name: `looker-dcl-data.orders.orders` ;;
  dimension: id {}
  dimension: user_id {}
  dimension: status {
    suggest_persist_for: "1 second"
  }
}

view: users {
  sql_table_name: `@{gcp_project_name}.{% parameter param_selector.test_parameter %}.users` ;;
  dimension: id {}
  dimension: gender {
    suggest_persist_for: "1 second"
  }
}

explore: orders {
  join: param_selector {}
  join: users {
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users.id} ;;
  }
}

view: param_selector {
  parameter: test_parameter { type: unquoted }
}

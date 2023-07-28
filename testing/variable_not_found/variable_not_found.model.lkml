connection: "looker-dcl-data"

view: orders {
  sql_table_name: `looker-dcl-data.orders.orders` ;;
  dimension: id {}
  dimension: user_id {}
  dimension: status {
    suggest_persist_for: "1 second"
  }
}

view: users_not_working {
  sql_table_name: `looker-dcl-data.{% parameter param_selector.test_parameter %}.users` ;;
  dimension: id {}
  dimension: gender {
    suggest_persist_for: "1 second"
  }
}

view: users_working {
  sql_table_name: `looker-dcl-data.orders.users` ;;
  dimension: id {}
  dimension: gender {
    suggest_persist_for: "1 second"
  }
}

explore: orders {
  # sql_always_where: "{% parameter param_selector.test_parameter %}" = "orders";;
  join: param_selector {}
  join: users_not_working {
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users_not_working.id} ;;
  }
  join: users_working {
    relationship: many_to_one
    sql_on: ${orders.user_id} = ${users_working.id} ;;
  }
}

view: param_selector {
  parameter: test_parameter {
    type: unquoted
    default_value: "orders"
    allowed_value: {
      value: "orders"
    }
    allowed_value: {
      value: "bob"
    }
    }
}

view: users {
  sql_table_name: bigquery-public-data.thelook_ecommerce.users ;;

  dimension: city {
    suggest_persist_for: "0 second"
  }
}

explore: users {}

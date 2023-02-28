view: users {
  # sql_table_name: bigquery-public-data.thelook_ecommerce.users ;;

  derived_table: {
    sql: SELECT
    city,
    RANK() OVER (ORDER BY city ASC) AS rank
    FROM bigquery-public-data.thelook_ecommerce.users
    GROUP BY 1
    ;;
  }

  dimension: city {
    sql: ${TABLE}.city ;;
    html:
    {% if rank._value <= 5 %}
    <font color="green">{{ value }}</font>
    {% else %}
    <font color="black">{{ value }}</font>
    {% endif %}
    ;;
  }

  dimension: rank {
    sql: ${TABLE}.rank ;;
  }

  measure: count {
    type: count
  }
}

explore: users {}

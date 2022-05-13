view: cascade_a {
  derived_table: {
    sql: select {% parameter label_param %} as label ;;
    persist_for: "10 seconds"
  }
  dimension: status {
    sql: ${TABLE}.status;;
  }


  parameter: label_param {
    default_value: "A"
  }
  dimension: label {}
}


view: cascade_c {


  derived_table: {
    datagroup_trigger: eight_hours_trigger_datagroup

    sql: select * from looker-dcl-data.orders.orders where
        DATE(created_at) = date_sub(CURRENT_DATE, interval {% parameter last_x_month %} month)
        ;;

    }

  parameter: last_x_month {
    type: number
    default_value: "1"
  }}

view: cascade_d {
  derived_table: {
    datagroup_trigger: eight_hours_trigger_datagroup

    sql: select * from looker-dcl-data.orders.orders where
        1 =  {% parameter last_x_month %}
              ;;

  }

    parameter: last_x_month {
      type: number
      default_value: "1"
    }}


  explore: cascade_a { hidden: yes}

  view: cascade_b {
    derived_table: {
      explore_source: cascade_a {
        column: label {}
      }
      persist_for: "12 hours"
    }
    dimension: label {}
  }

  explore: cascade_b {
    hidden: yes
  }

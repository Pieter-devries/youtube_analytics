view: cascade_a {
  derived_table: {
    sql: select {% parameter label_param %} as label ;;
  }

  parameter: label_param {
    default_value: "A"
  }
  dimension: label {}
  filter: today {
    type: date
    default_value: "today"
  }

parameter: date_filter {
  allowed_value: {
    label: "今日"
    value: "today"
  }
  allowed_value: {
    label: "直近7日間"
    value: "last_7_days"
  }
}


}



explore: cascade_b {
  hidden: yes
}

# view: cascade_c {
#   derived_table: {
#     explore_source: cascade_a {
#       column: label {}
#       bind_filters: {
#         to_field: cascade_a.label_param
#         from_field: cascade_c.label_param
#       }
#     }
#     # persist_for: "12 hours"
#   }
#   parameter: label_param {
#     default_value: "A"
#   }
#   dimension: label {}
# }

explore: cascade_a { hidden: yes}



##########################################################################################

view: cascade_c {


  derived_table: {
    datagroup_trigger: eight_hours_trigger_datagroup

    sql: select * from looker-dcl-data.orders.orders where
        DATE(created_at) = date_sub(CURRENT_DATE, interval {% parameter last_x_month %} month)
        ;;

    }
  dimension: status {
    sql: ${TABLE}.status;;
  }

  parameter: last_x_month {
    type: number
    default_value: "1"
  }}

# view: cascade_d {
#   derived_table: {
#     datagroup_trigger: eight_hours_trigger_datagroup

#     sql: select * from looker-dcl-data.orders.orders where
#         1 = {% parameter last_x_month %}
#               ;;
#   }

#   parameter: last_x_month {
#       type: number
#       default_value: "1"
#     }

#   dimension: status {
#     sql: ${TABLE}.status;;
#   }

#     }

##########################################################################################

  view: cascade_b {
    derived_table: {
      explore_source: cascade_a {
        column: label {}
      }
      persist_for: "12 hours"
    }
    dimension: label {}
  }

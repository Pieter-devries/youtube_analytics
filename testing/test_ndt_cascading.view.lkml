view: cascade_a {
  derived_table: {
    sql: select {% parameter label_param %} as label ;;
  }

parameter: label_param {
  default_value: "A"
}
dimension: label {}
}

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

explore: cascade_c {
  view_name: cascade_a
  join: cascade_b {}
  hidden: yes
}

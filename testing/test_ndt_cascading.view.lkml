view: cascade_a {
  derived_table: {
    sql: select {% parameter label_param %} as label ;;
    persist_for: "10 seconds"
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

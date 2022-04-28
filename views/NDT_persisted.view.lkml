explore: ndt_persisted {}
view: ndt_persisted {
    derived_table: {
      explore_source: channel_basic_a2_daily_first {
        column: title { field: video_info.title }
        column: views {}
      }
      sql_trigger_value: SELECT FORMAT_TIMESTAMP('%F', CURRENT_TIMESTAMP(), 'America/Los_Angeles') ;;
    }
    dimension: title {}
    dimension: views {
      label: "Basic Views"
      type: number
    }
  }

#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }

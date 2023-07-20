connection: "youtube_database"

include: "test_explore.explore"

fiscal_month_offset: -1

datagroup: test_dg {
  max_cache_age: "1 hour"
  sql_trigger: current_date() ;;
}
explore: vietnam_map {}
map_layer: vietnam_islands {
  url: "https://gist.githubusercontent.com/tandat2209/5eb797fc2bcc1c8b6d71271353a40ab4/raw/ca883f00b7843afeb7b6ad73ec4370ab514a8a90/vietnam-with-paracel-and-spartly-islands.json"
  format: topojson
  property_key: "NAME_0"
  property_label_key: "Location"
}
map_layer: countrie {
  file: "../countries.geojson"
  # format: vector_tile_region
  property_key: "ADMIN"
  property_label_key: "Location"
}
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

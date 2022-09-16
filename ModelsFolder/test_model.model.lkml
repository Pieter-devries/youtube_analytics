connection: "youtube_database"

include: "/testing/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: test_explore {
  view_name: streamlined_data

  aggregate_table: new_name {
    query:  {
      dimensions: [streamlined_data.date_date]
      measures: [streamlined_data.total_views]
    }
    materialization: {
      sql_trigger_value: 1 ;;
    }
  }
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

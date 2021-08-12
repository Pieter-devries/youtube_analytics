# # If necessary, uncomment the line below to include explore_source.
# include: "/ModelsFolder/thesis_cool.model.lkml"
#
# view: ndt_test {
#   derived_table: {
#     explore_source: channel_basic_a2_daily_first {
#       column: metric_chooser {}
#       bind_filters: {
#         to_field: channel_basic_a2_daily_first.dynamic_measure
#         from_field: ndt_test.dynamic_measure
#       }
#     }
#   }
#   dimension: metric_chooser {
#     label: "Basic Metric Chooser"
#     description: "Use with Metric_Picker Filter Only"
#     type: number
#   }
#
#   parameter: dynamic_measure {
#     description: "Choose Type with Chooser"
#     type: string
#     allowed_value: {
#       label: "Total Views"
#       value: "views"
#     }
#     allowed_value: {
#       label: "Average Watch Time"
#       value: "avg_watch_time"
#     }
#     allowed_value: {
#       label: "Subscriber Change"
#       value: "subscriber_change"
#     }
#     allowed_value: {
#       label: "Shares"
#       value: "shares"
#     }
#     allowed_value: {
#       label: "Like Change"
#       value: "like_change"
#     }
#     allowed_value: {
#       label: "Key_Points"
#       value: "key_points"
#     }
#   }
# }
#
# explore: ndt_test {}

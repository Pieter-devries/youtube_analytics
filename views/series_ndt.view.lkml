view: series_ndt {
  derived_table: {
    explore_source: series_analysis {
      column: views {}
      column: watch_time_hours {}
      column: video_name { field: video_info.video_name }
#       filters: {
#         field: video_info.title
#         value: "鬼滅の刃"
#       }
#       bind_filters: {
#         from_field: video_info.title
#         to_field: series_ndt.title
#       }
        bind_all_filters: yes
    }
  }
  dimension: views {
    label: "Basic Views"
    type: number
  }
  dimension: watch_time_hours {
    label: "Basic Watch Time Hours"
    value_format: "#,###"
    type: number
  }
  dimension: video_name {

  }
}

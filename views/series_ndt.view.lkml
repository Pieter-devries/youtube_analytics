view: series_ndt {
  derived_table: {
    explore_source: series_analysis {
      column: views {}
      column: watch_time_hours {}
      column: video_name { field: scrape_data.video_name }
#       filters: {
#         field: scrape_data.title
#         value: "鬼滅の刃"
#       }
#       bind_filters: {
#         from_field: scrape_data.title
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
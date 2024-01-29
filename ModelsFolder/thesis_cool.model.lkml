## adding for test

connection: "@{connection}"
#include: "manifest.lkml"
label: "Youtube"


# include all the views
include: "/views/*"
include: "/Lookml_Dashboards/*.dashboard*"
datagroup: youtube_transfer {
  sql_trigger: SELECT COUNT(*) FROM channel_basic_a2_daily_first;;
  max_cache_age: "24 hour"
}

persist_with: youtube_transfer

named_value_format: usd_conditional {
  value_format: "[>=1000000]$0.0,,\"M\";[>=1000]$0.0,\"K\";$0"
  strict_value_format: yes
}

named_value_format: number_conditional {
  value_format: "[>=1000000]\"¥\"0.0,,\"M\";[>=1000]\"¥\"0.0,\"K\";\"¥\"0"
}


explore: series_analysis {
  from: channel_basic_a2_daily_first
  always_filter: {
    filters: [
      scrape_data.playlist_name: "鬼滅の刃"
    ]
  }
  join: scrape_data {
    type: left_outer
    sql_on: ${scrape_data.video_id} = ${series_analysis.video_id} ;;
    relationship: many_to_one
  }
  join: genre_total {
    type: left_outer
    sql_on: ${genre_total.video_id} = ${series_analysis.video_id} ;;
    relationship: many_to_many
  }
  join: series_ndt {
    type: left_outer
    sql_on: ${scrape_data.video_name} = ${series_ndt.video_name} ;;
    relationship: one_to_one
  }
}

explore: channel_basic_a2_daily_first {
  # sql_always_where: ${_data_date} != CURRENT_DATE('Japan') ;;
  query: subscriber_views {
    dimensions: [channel_basic_a2_daily_first.subscribed_status]
    measures: [channel_basic_a2_daily_first.views]
    sorts: [channel_basic_a2_daily_first.subscribed_status: desc]
  }
  query: age_views {
    dimensions: [demographics_dt.age_group]
    measures: [demographics_dt.count]
    sorts: [demographics_dt.count: desc]
    filters: []
  }
  query: traffic_source {
    dimensions: [traffic.traffic_source]
    measures: [traffic.views]
    sorts: [traffic.views: desc ]
  }
  label: "Master  Explore"
  aggregate_table: views_last_7_days {
    query:  {
      dimensions: [channel_basic_a2_daily_first.date]
      measures: [channel_basic_a2_daily_first.views]
      }
      materialization: {datagroup_trigger:youtube_transfer}
      }
  join: scrape_data {
    fields: [scrape_data.video_name,scrape_data.playlist_name, scrape_data.episode_number, scrape_data.colored_playlist]
    type: left_outer
    sql_on: ${scrape_data.video_id} = ${channel_basic_a2_daily_first.video_id} ;;
    relationship: many_to_one
  }
  join: video_days {
    type: left_outer
    sql_on: ${channel_basic_a2_daily_first.video_id} = ${video_days.video_id} ;;
    relationship: many_to_one
  }
  join: demographics_dt {
    type: left_outer
    sql_on: ${channel_basic_a2_daily_first.video_id} = ${demographics_dt.video_id}  ;;
    relationship: many_to_many
  }
  join: genre_total {
    type: left_outer
    sql_on: ${genre_total.video_id} = ${channel_basic_a2_daily_first.video_id} ;;
    relationship: many_to_many
}
  join: playback {
    view_label: "Basic"
    fields: [playback.playback_location_detail,playback.playback_location]
    type: left_outer
    sql_on: ${channel_basic_a2_daily_first.video_id} = ${playback.video_id}
    AND ${channel_basic_a2_daily_first._data_date} = ${playback._data_date} ;;
    relationship: many_to_many
  }
  join: traffic {
    from: traffic_source
    type: left_outer
    sql_on: ${traffic.video_id} = ${scrape_data.video_id} ;;
    relationship: one_to_many
    }
  join: monthly_views {
    type: cross
    # sql_on: ${channel_basic_a2_daily_first._data_month} = ${monthly_views.month} ;;
  }
}


explore: demographics_dt {
  join:  scrape_data {
    type: left_outer
    sql_on: ${demographics_dt.video_id} = ${scrape_data.video_id} ;;
    relationship: many_to_one
  }
  join: genre_total {
    type: left_outer
    sql_on: ${genre_total.video_id} = ${demographics_dt.video_id} ;;
    relationship: many_to_many
  }
  }


explore: genre_total {
  label: "Genre Info"
}

explore: traffic_source {
  description: "this is my description"
  join: scrape_data {
    type: left_outer
    sql_on: ${traffic_source.video_id} = ${scrape_data.video_id} ;;
    relationship: many_to_one
  }
}

# explore: sharing {
#   join: channel_basic_a2_daily_first {
#     type: left_outer
#     sql_on: ${sharing.video_id} = ${channel_basic_a2_daily_first.video_id}
#     and ${channel_basic_a2_daily_first._data_date} = ${sharing._data_date};;
#     relationship: many_to_many
#   }
#   join: scrape_data {
#     type: left_outer
#     sql_on: ${sharing.video_id} = ${scrape_data.video_id} ;;
#     relationship: many_to_one
#   }
# }

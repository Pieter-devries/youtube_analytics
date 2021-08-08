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
      video_info.title: "鬼滅の刃"
    ]
  }
  join: video_info {
    type: left_outer
    sql_on: ${video_info.video_id} = ${series_analysis.video_id} ;;
    relationship: many_to_one
  }
  join: genre_total {
    type: left_outer
    sql_on: ${genre_total.video_id} = ${series_analysis.video_id} ;;
    relationship: many_to_many
  }
  join: series_ndt {
    type: left_outer
    sql_on: ${video_info.video_name} = ${series_ndt.video_name} ;;
    relationship: one_to_one
  }
}

explore: channel_basic_a2_daily_first {
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
  label: "Master Explore"
  aggregate_table: views_last_7_days {
    query:  {
      dimensions: [channel_basic_a2_daily_first.date]
      measures: [channel_basic_a2_daily_first.views]
      }
      materialization: {datagroup_trigger:youtube_transfer}
      }
  join: video_info {
    type: left_outer
    sql_on: ${video_info.video_id} = ${channel_basic_a2_daily_first.video_id} ;;
    relationship: many_to_one
  }
  join: video_days {
    type: left_outer
    sql_on: ${channel_basic_a2_daily_first.video_id} = ${video_days.video_id} ;;
    relationship: many_to_one
  }
  join: demographics_dt {
    type: left_outer
    sql_on: ${video_info.video_id} = ${demographics_dt.video_id}  ;;
    relationship: one_to_many
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
    sql_on: ${traffic.video_id} = ${video_info.video_id} ;;
    relationship: one_to_many
    }
}


explore: demographics_dt {
  join:  video_info {
    type: left_outer
    sql_on: ${demographics_dt.video_id} = ${video_info.video_id} ;;
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
  join: video_info {
    type: left_outer
    sql_on: ${traffic_source.video_id} = ${video_info.video_id} ;;
    relationship: many_to_one
  }
}

explore: sharing {
  join: channel_basic_a2_daily_first {
    type: left_outer
    sql_on: ${sharing.video_id} = ${channel_basic_a2_daily_first.video_id}
    and ${channel_basic_a2_daily_first._data_date} = ${sharing._data_date};;
    relationship: many_to_many
  }
  join: video_info {
    type: left_outer
    sql_on: ${sharing.video_id} = ${video_info.video_id} ;;
    relationship: many_to_one
  }
}

explore: playback {
  hidden: yes
  join: parameter{
    sql:  ;;
  relationship: one_to_one
  }

}

explore: LAG_TEST {
hidden: yes
}

explore: multi_date_test {
  hidden: yes
}

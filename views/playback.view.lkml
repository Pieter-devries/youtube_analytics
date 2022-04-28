view: playback {
  sql_table_name: YoutubeData.playback ;;

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension: average_view_duration_seconds {
    type: number
    sql: ${TABLE}.average_view_duration_seconds ;;
  }


  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: playback_location {
    group_label: "Playback"
    type: string
    sql: ${TABLE}.playback_location ;;
    drill_fields: [playback*]
  }

  dimension: playback_location_detail {
    group_label: "Playback"
    type: string
    sql: ${TABLE}.playback_location_detail ;;
  }

  dimension: playback_location_type {
    type: number
    sql: ${TABLE}.playback_location_type ;;
  }

  dimension: primary_key {
    hidden:  yes
    primary_key: yes
    type: string
    sql: ${TABLE}.primary_key ;;
  }

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  measure: views {
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: watch_time_minutes {
    type: sum
    sql: ${TABLE}.watch_time_minutes ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }

  set: playback {
    fields: [date,playback_location,playback_location_detail,watch_time_minutes]
  }

}

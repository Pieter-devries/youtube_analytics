view: sharing {
  sql_table_name: YoutubeData.sharing ;;

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.primary_key;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_week,
      day_of_week_index,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: shares {
    type: number
    sql: ${TABLE}.shares ;;
  }

  dimension: sharing_service {
    hidden: yes
    type: number
    sql: ${TABLE}.sharing_service ;;
  }

  dimension: sharingservice {
    type: string
    sql: ${TABLE}.sharingservice ;;
    drill_fields: [video_info.title,video_info.video_name,Basic.vid_stats*]
  }

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  measure: count {
    type: count
    drill_fields: [video_info.title,video_info.video_name,Basic.vid_stats*]
  }
}

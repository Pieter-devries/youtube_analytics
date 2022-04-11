view: channel_end_screens_a1_daily_first {
  sql_table_name: `YoutubeData.channel_end_screens_a1_daily_first`
    ;;

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

  dimension_group: _latest {
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
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: end_screen_element_click_rate {
    type: number
    sql: ${TABLE}.end_screen_element_click_rate ;;
  }

  dimension: end_screen_element_clicks {
    type: number
    sql: ${TABLE}.end_screen_element_clicks ;;
  }

  dimension: end_screen_element_id {
    type: string
    sql: ${TABLE}.end_screen_element_id ;;
  }

  dimension: end_screen_element_impressions {
    type: number
    sql: ${TABLE}.end_screen_element_impressions ;;
  }

  dimension: end_screen_element_type {
    type: number
    sql: ${TABLE}.end_screen_element_type ;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
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
    drill_fields: []
  }
}

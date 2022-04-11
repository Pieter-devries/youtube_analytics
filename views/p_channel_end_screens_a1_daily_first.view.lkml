view: p_channel_end_screens_a1_daily_first {
  sql_table_name: `YoutubeData.p_channel_end_screens_a1_daily_first`
    ;;

  dimension_group: _partitiondate {
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
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
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
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: channel_id {
    type: string
    description: "The ID for a YouTube channel."
    sql: ${TABLE}.channel_id ;;
  }

  dimension: country_code {
    type: string
    description: "The country associated with the metrics in the report row. The dimension value is a two-letter ISO-3166-1 country code, such as US, CN (China), or FR (France). The country code ZZ is used to report metrics for which YouTube could not identify the associated country."
    sql: ${TABLE}.country_code ;;
  }

  dimension: date {
    type: string
    description: "This dimension identifies the date associated with the metrics in each report row. All bulk reports contain data for a unique 24-hour period beginning at 12:00 a.m. Pacific time (UTC-8)."
    sql: ${TABLE}.date ;;
  }

  dimension: end_screen_element_click_rate {
    type: number
    description: "The end screen element click rate."
    sql: ${TABLE}.end_screen_element_click_rate ;;
  }

  dimension: end_screen_element_clicks {
    type: number
    description: "The number of end screen element clicks."
    sql: ${TABLE}.end_screen_element_clicks ;;
  }

  dimension: end_screen_element_id {
    type: string
    description: "The end screen element id."
    sql: ${TABLE}.end_screen_element_id ;;
  }

  dimension: end_screen_element_impressions {
    type: number
    description: "The number of end screen element impressions."
    sql: ${TABLE}.end_screen_element_impressions ;;
  }

  dimension: end_screen_element_type {
    type: number
    description: "The end screen element type."
    sql: ${TABLE}.end_screen_element_type ;;
  }

  dimension: live_or_on_demand {
    type: string
    description: "This dimension indicates whether the user activity metrics in the data row are associated with views of a live broadcast."
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: subscribed_status {
    type: string
    description: "This dimension indicates whether the user activity metrics in the data row are associated with viewers who were subscribed to the video's or playlist's channel."
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: video_id {
    type: string
    description: "The ID of a YouTube video."
    sql: ${TABLE}.video_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

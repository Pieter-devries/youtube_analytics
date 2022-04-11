view: p_channel_annotations_a1_daily_first {
  sql_table_name: `YoutubeData.p_channel_annotations_a1_daily_first`
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

  dimension: annotation_click_through_rate {
    type: number
    description: "The ratio of annotations that viewers clicked to the total number of clickable annotation impressions."
    sql: ${TABLE}.annotation_click_through_rate ;;
  }

  dimension: annotation_clickable_impressions {
    type: number
    description: "The number of annotations that appeared and could be clicked."
    sql: ${TABLE}.annotation_clickable_impressions ;;
  }

  dimension: annotation_clicks {
    type: number
    description: "The number of clicked annotations."
    sql: ${TABLE}.annotation_clicks ;;
  }

  dimension: annotation_closable_impressions {
    type: number
    description: "The number of annotations that appeared and could be closed."
    sql: ${TABLE}.annotation_closable_impressions ;;
  }

  dimension: annotation_close_rate {
    type: number
    description: "The ratio of annotations that viewers closed to the total number of annotation impressions."
    sql: ${TABLE}.annotation_close_rate ;;
  }

  dimension: annotation_closes {
    type: number
    description: "The number of closed annotations."
    sql: ${TABLE}.annotation_closes ;;
  }

  dimension: annotation_id {
    type: string
    description: "The ID that YouTube uses to uniquely identify an annotation."
    sql: ${TABLE}.annotation_id ;;
  }

  dimension: annotation_impressions {
    type: number
    description: "The total number of annotation impressions."
    sql: ${TABLE}.annotation_impressions ;;
  }

  dimension: annotation_type {
    type: number
    description: "This dimension identifies the manner in which the annotation displays during the video."
    sql: ${TABLE}.annotation_type ;;
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

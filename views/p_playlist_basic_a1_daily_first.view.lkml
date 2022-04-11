view: p_playlist_basic_a1_daily_first {
  sql_table_name: `YoutubeData.p_playlist_basic_a1_daily_first`
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

  dimension: average_view_duration_seconds {
    type: number
    description: "The average length, in seconds, of video playbacks. In a playlist report, the metric indicates the average length, in seconds, of video playbacks that occurred in the context of a playlist."
    sql: ${TABLE}.average_view_duration_seconds ;;
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

  dimension: playlist_id {
    type: string
    description: "The ID of a YouTube playlist."
    sql: ${TABLE}.playlist_id ;;
  }

  dimension: playlist_saves_added {
    type: number
    description: "The number of times that users saved a playlist."
    sql: ${TABLE}.playlist_saves_added ;;
  }

  dimension: playlist_saves_removed {
    type: number
    description: "The number of times that users removed the playlist from their lists of saved playlists."
    sql: ${TABLE}.playlist_saves_removed ;;
  }

  dimension: playlist_starts {
    type: number
    description: "The number of times that viewers initiated playback of a playlist."
    sql: ${TABLE}.playlist_starts ;;
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

  dimension: views {
    type: number
    description: "The number of times that a video was viewed. In a playlist report, the metric indicates the number of times that a video was viewed in the context of a playlist."
    sql: ${TABLE}.views ;;
  }

  dimension: watch_time_minutes {
    type: number
    description: "The number of minutes that users watched videos for the specified channel, content owner, video, or playlist."
    sql: ${TABLE}.watch_time_minutes ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: p_channel_basic_a2_daily_first {
  sql_table_name: `YoutubeData.p_channel_basic_a2_daily_first`
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

  dimension: annotation_impressions {
    type: number
    description: "The total number of annotation impressions."
    sql: ${TABLE}.annotation_impressions ;;
  }

  dimension: average_view_duration_percentage {
    type: number
    description: "The average percentage of a video watched during a video playback."
    sql: ${TABLE}.average_view_duration_percentage ;;
  }

  dimension: average_view_duration_seconds {
    type: number
    description: "The average length, in seconds, of video playbacks. In a playlist report, the metric indicates the average length, in seconds, of video playbacks that occurred in the context of a playlist."
    sql: ${TABLE}.average_view_duration_seconds ;;
  }

  dimension: card_click_rate {
    type: number
    description: "The click-through-rate for cards, which is calculated as the ratio of card clicks to card impressions."
    sql: ${TABLE}.card_click_rate ;;
  }

  dimension: card_clicks {
    type: number
    description: "The number of times that cards were clicked."
    sql: ${TABLE}.card_clicks ;;
  }

  dimension: card_impressions {
    type: number
    description: "The number of times cards were displayed. When the card panel is opened, a card impression is logged for each of the video's cards."
    sql: ${TABLE}.card_impressions ;;
  }

  dimension: card_teaser_click_rate {
    type: number
    description: "The click-through-rate for card teasers, which is calculated as the ratio of clicks on card teasers to the total number of card teaser impressions."
    sql: ${TABLE}.card_teaser_click_rate ;;
  }

  dimension: card_teaser_clicks {
    type: number
    description: "The number of clicks on card teasers. Card icon clicks are attributed to the last teaser displayed to the user."
    sql: ${TABLE}.card_teaser_clicks ;;
  }

  dimension: card_teaser_impressions {
    type: number
    description: "The number of times that card teasers were displayed. A video view can generate multiple teaser impressions."
    sql: ${TABLE}.card_teaser_impressions ;;
  }

  dimension: channel_id {
    type: string
    description: "The ID for a YouTube channel."
    sql: ${TABLE}.channel_id ;;
  }

  dimension: comments {
    type: number
    description: "The number of times that users commented on a video."
    sql: ${TABLE}.comments ;;
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

  dimension: dislikes {
    type: number
    description: "The number of times that users indicated that they disliked a video by giving it a negative rating."
    sql: ${TABLE}.dislikes ;;
  }

  dimension: likes {
    type: number
    description: "The number of times that users indicated that they liked a video by giving it a positive rating."
    sql: ${TABLE}.likes ;;
  }

  dimension: live_or_on_demand {
    type: string
    description: "This dimension indicates whether the user activity metrics in the data row are associated with views of a live broadcast."
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: red_views {
    type: number
    description: "The number of YouTube Red views."
    sql: ${TABLE}.red_views ;;
  }

  dimension: red_watch_time_minutes {
    type: number
    description: "The number of minutes that YouTube Red subscribers watched content."
    sql: ${TABLE}.red_watch_time_minutes ;;
  }

  dimension: shares {
    type: number
    description: "The number of times that users shared a video through the Share button."
    sql: ${TABLE}.shares ;;
  }

  dimension: subscribed_status {
    type: string
    description: "This dimension indicates whether the user activity metrics in the data row are associated with viewers who were subscribed to the video's or playlist's channel."
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: subscribers_gained {
    type: number
    description: "The number of times that users subscribed to a channel."
    sql: ${TABLE}.subscribers_gained ;;
  }

  dimension: subscribers_lost {
    type: number
    description: "The number of times that users unsubscribed from a channel."
    sql: ${TABLE}.subscribers_lost ;;
  }

  dimension: video_id {
    type: string
    description: "The ID of a YouTube video."
    sql: ${TABLE}.video_id ;;
  }

  dimension: videos_added_to_playlists {
    type: number
    description: "The number of times that videos were added to any YouTube playlists."
    sql: ${TABLE}.videos_added_to_playlists ;;
  }

  dimension: videos_removed_from_playlists {
    type: number
    description: "The number of times that videos were removed from any YouTube playlists."
    sql: ${TABLE}.videos_removed_from_playlists ;;
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

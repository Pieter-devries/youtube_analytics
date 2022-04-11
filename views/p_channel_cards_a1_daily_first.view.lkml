view: p_channel_cards_a1_daily_first {
  sql_table_name: `YoutubeData.p_channel_cards_a1_daily_first`
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

  dimension: card_id {
    type: string
    description: "The ID that YouTube uses to uniquely identify a card."
    sql: ${TABLE}.card_id ;;
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

  dimension: card_type {
    type: number
    description: "This dimension identifies the type of card that was displayed to the user."
    sql: ${TABLE}.card_type ;;
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

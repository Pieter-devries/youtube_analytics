view: video_info {
  sql_table_name: `YoutubeData.video_info`
    ;;

  dimension: anime_title {
    type: string
    sql: ${TABLE}.anime_title ;;
  }

  dimension: comment_num {
    type: number
    sql: ${TABLE}.comment_num ;;
  }

  dimension: dislike_num {
    type: number
    sql: ${TABLE}.dislike_num ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
  }

  dimension: genre_1 {
    type: string
    sql: ${TABLE}.genre_1 ;;
  }

  dimension: genre_2 {
    type: string
    sql: ${TABLE}.genre_2 ;;
  }

  dimension: genre_3 {
    type: string
    sql: ${TABLE}.genre_3 ;;
  }

  dimension: genre_4 {
    type: string
    sql: ${TABLE}.genre_4 ;;
  }

  dimension: like_num {
    type: number
    sql: ${TABLE}.like_num ;;
  }

  dimension: playlist_name {
    type: string
    sql: ${TABLE}.playlist_name ;;
  }

  dimension: playlist_url {
    type: string
    sql: ${TABLE}.playlist_url ;;
  }

  dimension_group: published {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.published_date ;;
  }

  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: video_name {
    type: string
    sql: ${TABLE}.video_name ;;
  }

  dimension: video_url {
    type: string
    sql: ${TABLE}.video_url ;;
  }

  dimension: view_num {
    type: number
    sql: ${TABLE}.view_num ;;
  }

  measure: count {
    type: count
    drill_fields: [video_name, playlist_name]
  }
}

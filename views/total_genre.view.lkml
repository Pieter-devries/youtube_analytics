view: total_genre {
  sql_table_name: `YoutubeData.total_genre`
    ;;

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: primary_key {
    type: string
    sql: ${TABLE}.primary_key ;;
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

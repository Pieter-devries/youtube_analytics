view: scrape_data {
  derived_table: {
  sql_trigger_value: 1;;
  sql:
  SELECT *
  FROM scrape_data
    ;;
}
  dimension: comment_count {
    type: number
    sql: ${TABLE}.comment_count ;;
  }

  dimension: like_count {
    type: number
    sql: ${TABLE}.like_count ;;
  }

  dimension: published_at {
    type: date_time
    datatype: datetime
    sql: ${TABLE}.published_at ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: video_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: video_name {
    type: string
    sql: ${TABLE}.video_name ;;
  }

  dimension: view_count {
    type: number
    sql: ${TABLE}.view_count ;;
  }

  measure: count {
    type: count
    drill_fields: [video_name]
  }

  dimension: playlist_name {
    sql:
    CASE
      WHEN strpos(${video_name},"【") > 0
        THEN
          CASE
            WHEN strpos(${video_name},regexp_extract(${video_name},r"([0-9])")) < 11 OR strpos(${video_name},regexp_extract(${video_name},r"([0-9])")) IS NULL
              THEN substr(${video_name},strpos(${video_name},"【")+1,((strpos(${video_name},"】")-1)-(strpos(${video_name},"【"))))
            WHEN substr(${video_name},strpos(${video_name},"【")+1,((strpos(${video_name},"】")-1)-(strpos(${video_name},"【")))) = "海外の反応 アニメ"
              THEN TRIM(substr(${video_name},strpos(${video_name},"】")+1,strpos(${video_name},regexp_extract(${video_name},r"([0-9])"))-CHAR_LENGTH("【海外の反応 アニメ】 ")))
              ELSE substr(${video_name},strpos(${video_name},"【")+1,((strpos(${video_name},"】")-1)-(strpos(${video_name},"【"))))
          END
      ELSE "no_playlist"
    END
        ;;
  }

}

view: scrape_data {
  derived_table: {
  sql_trigger_value: 1;;
  sql:
  SELECT *
  FROM scrape_data
    ;;
}

  dimension: video_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: video_name {
    view_label: "Basic"
    group_label: "Video Info"
    type: string
    sql: ${TABLE}.video_name ;;
  }

  dimension: episode_number {
    view_label: "Basic"
    group_label: "Video Info"
    type: number
    sql:
    CASE
      WHEN SUBSTR(${video_name},STRPOS(${video_name},REGEXP_EXTRACT(${video_name},r"([0-9]話)")),0) IS NOT NULL
        THEN TRIM(REGEXP_REPLACE(SUBSTR(${video_name},STRPOS(${video_name},REGEXP_EXTRACT(${video_name},r"( [0-9])")),4),r"\D+",""))
      ELSE null
    END;;
  }

  dimension: playlist_name {
    view_label: "Basic"
    group_label: "Video Info"
    sql:
    CASE
      WHEN STRPOS(${video_name},"【") > 0
        THEN
          CASE
            WHEN STRPOS(${video_name},REGEXP_EXTRACT(${video_name},r"([0-9])")) < 11 OR STRPOS(${video_name},REGEXP_EXTRACT(${video_name},r"([0-9])")) IS NULL
              THEN SUBSTR(${video_name},STRPOS(${video_name},"【")+1,((STRPOS(${video_name},"】")-1)-(STRPOS(${video_name},"【"))))
            WHEN SUBSTR(${video_name},STRPOS(${video_name},"【")+1,((STRPOS(${video_name},"】")-1)-(STRPOS(${video_name},"【")))) = "海外の反応 アニメ"
              THEN TRIM(SUBSTR(${video_name},STRPOS(${video_name},"】")+1,STRPOS(${video_name},REGEXP_EXTRACT(${video_name},r"([0-9])"))-CHAR_LENGTH("【海外の反応 アニメ】 ")))
              ELSE SUBSTR(${video_name},STRPOS(${video_name},"【")+1,((STRPOS(${video_name},"】")-1)-(STRPOS(${video_name},"【"))))
          END
      ELSE "no_playlist"
    END
        ;;
  }

}

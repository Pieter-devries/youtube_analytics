view: scrape_data {
  derived_table: {
  sql_trigger_value: 1;;
  sql:
  SELECT DISTINCT *
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

  # dimension: episode_number {
  #   drill_fields: [video_name]
  #   view_label: "Basic"
  #   group_label: "Video Info"
  #   type: number
  #   sql:
  #   CASE
  #     WHEN SUBSTR(${video_name},STRPOS(${video_name},REGEXP_EXTRACT(${video_name},r"([0-9]話)")),0) IS NOT NULL
  #       THEN CAST(TRIM(REGEXP_REPLACE(SUBSTR(${video_name},STRPOS(${video_name},REGEXP_EXTRACT(${video_name},r"( [0-9])")),4),r"\D+","")) as NUMERIC)
  #     ELSE null
  #   END;;
  # }

  dimension: playlist_name {
    # description: "{{rendered_value}}"
    html: <a title={{ scrape_data.playlist_name._rendered_value }}> {{ scrape_data.playlist_name._rendered_value }} </a> ;;
    # drill_fields: [episode_number,basic.views]
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

  dimension: colored_playlist {
    type: number
    sql:
    CASE
      WHEN ${playlist_name} = "魔女の旅々" THEN 1
      WHEN ${playlist_name} = "鬼滅の刃" THEN 2
      WHEN ${playlist_name} = "銀河英雄伝説" THEN 3
    END
    ;;
    html:
    {% if value == 1 %}
    魔女の旅々
    {% elsif value == 2 %}
    鬼滅の刃
    {% elsif value == 3 %}
    銀河英雄伝説
    {% endif %}
    ;;
  }
}

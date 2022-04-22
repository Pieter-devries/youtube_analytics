view: scrape_data {
  derived_table: {
  sql_trigger_value: 1;;
  sql:
  SELECT *
  FROM `thesis-project-252601.YoutubeData.scrape_data`
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

  dimension: remove_kaigai {
    hidden: yes
    sql: TRIM(SUBSTR(replace(${video_name},"【海外の反応 アニメ】",""),0,STRPOS(replace(${video_name},"【海外の反応 アニメ】",""),"話"))) ;;
  }

  dimension: remove_pieter {
    hidden: yes
    sql: TRIM(SUBSTR(replace(${remove_kaigai},"ピーターの反応",""),0,STRPOS(replace(${remove_kaigai},"ピーターの反応",""),"話"))) ;;
  }

  dimension: remove_bracket {
    hidden: yes
    sql: TRIM(SUBSTR(replace(${remove_pieter},"【】",""),0,STRPOS(replace(${remove_pieter},"【】",""),"話"))) ;;
  }

  dimension: cleaned_name {
    type: string
    sql: ${remove_bracket}
      ;;
    link: {
      label: "Video URL"
      url: "https://www.youtube.com/watch?v={{ video_info.video_id._value | url_encode}}"
    }
    link: {
      label: "Video Dashboard"
      url: "/dashboards/6?Video_Name={{filterable_value | url_encode}}"
      icon_url: "https://image.flaticon.com/icons/png/512/87/87578.png"
    }
  }

}

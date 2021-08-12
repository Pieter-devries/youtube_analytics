view: multi_date_test {
    derived_table: {
      sql:
      SELECT
        video_id,
        SUM(views) AS total_views
      FROM
        channel_basic_a2_daily_first
      WHERE
      {% condition date1 %} CAST(channel_basic_a2_daily_first._DATA_DATE AS TIMESTAMP) {% endcondition %}
     OR {% condition date2 %} CAST(channel_basic_a2_daily_first._LATEST_DATE AS TIMESTAMP) {% endcondition %}
    GROUP BY 1
    ;;
    }

    filter: date1 {
      type: date
    }
    filter: date2 {
      type: date
    }

dimension: video_id {
  primary_key: yes
  type: string
  sql: ${TABLE}.video_id ;;
}

dimension: total_views {
  type: number
  sql: ${TABLE}.total_views ;;
}
}

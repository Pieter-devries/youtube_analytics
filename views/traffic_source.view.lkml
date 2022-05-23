view: traffic_source {
  derived_table: {
    sql_trigger_value: select current_date() ;;
    publish_as_db_view: yes
    sql:
      SELECT
      *,
      PARSE_DATE("%Y%m%d",date) AS _DATA_DATE,
      CASE WHEN traffic_source_type = 0 THEN "Direct or Unknown"
           WHEN traffic_source_type = 1 THEN "Youtube Advertising"
           WHEN traffic_source_type = 3 THEN "Browse Features"
           WHEN traffic_source_type = 4 THEN "Youtube Channels"
           WHEN traffic_source_type = 5 THEN "Youtube Search"
           WHEN traffic_source_type = 7 THEN "Suggested Videos"
           WHEN traffic_source_type = 8 THEN "Other Youtube Features"
           WHEN traffic_source_type = 9 THEN "External"
           WHEN traffic_source_type = 11 THEN "Video Cards/Annotations"
           WHEN traffic_source_type = 14 THEN "Playlists"
           WHEN traffic_source_type = 17 THEN "Notifications"
           WHEN traffic_source_type = 18 THEN "Playlist Page"
           WHEN traffic_source_type = 20 THEN "END Screens"
      END as traffic_source,
      GENERATE_UUID() as primary_key
    FROM
      p_channel_traffic_source_a2_daily_first ;;
}

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension: day_of_week_colored {
    group_label: "Data Date"
    sql: ${_data_day_of_week} ;;
    html:
    {% if value != "Sunday" and value != "Saturday"%}
    <font color="green">{{ value }}</font>
    {% else %}
    <font color="blue">{{ value }}</font>
    {% endif %}
    ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.primary_key ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
    drill_fields: [traffic_source_detail]
  }

  dimension: traffic_source_detail {
    type: string
    sql: ${TABLE}.traffic_source_detail ;;
    drill_fields: [scrape_data.title,channel_basic_a2_daily_first.video_stats*]
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  measure: total_views {
    type: sum
    sql: ${views} ;;
  }

  measure: formatted_total_views {
    type: sum
    sql: ${views} ;;
    html:
    {% if day_of_week_colored._value != "Sunday" and day_of_week_colored._value != "Saturday"%}
    <font color="green">{{ value }}</font>
    {% else %}
    <font color="blue">{{ value }}</font>
    {% endif %}
    ;;
  }

  measure: watch_time_minutes {
    type: sum
    sql: ${TABLE}.watch_time_minutes ;;
    value_format_name: "decimal_0"
  }

  dimension: average_view_duration_seconds {
    type: number
    sql: ${TABLE}.average_view_duration_seconds  ;;
  }

  dimension: average_view_duration_percentage {
    type: number
    sql: ${TABLE}.average_view_duration_percentage  ;;
    value_format: "0.xx\%"
  }
}

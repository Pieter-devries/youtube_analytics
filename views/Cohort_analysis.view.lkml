# ------------
# COHORT ANALYSIS
# ------------
include: "*Basic.view"

view: video_based_cohort_analysis {
  derived_table: {
    sql: SELECT
        distinct video_id,
        date,
        views,
        watch_time_minutes,
        MIN(DATE) as posted_date
      FROM
        channel_basic_a2_daily_first b
      GROUP BY
        1,2,3,4
      HAVING
      {% condition video_dated %} posted_date {% endcondition %}
       ;;
  #  datagroup_trigger: thesis_cool_default_datagroup
  }

  filter: video_dated {
    type: string
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: CONCAT(${video_id},${video_posted_date},${dont_use}) ;;
  }

  dimension: video_posted_date {
    type: string
    sql: ${TABLE}.posted_date ;;
  }

  dimension: dont_use {
    hidden: yes
    type: string
    sql: CONCAT(cast(${views} as string),${video_id}) ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  dimension: watch_time_minutes {
    type: number
    sql: ${TABLE}.watch_time_minutes ;;
    value_format: "#"
  }
  measure: videos_per_day {
    type: count_distinct
    sql: ${video_id} ;;
  }


  set: detail {
    fields: [video_id, video_posted_date]
  }

  parameter: view_measure_picker {
    description: "Analyze Views"
    type: unquoted
    allowed_value: {
      label: "Total Views"
      value: "SUM"}
    allowed_value: {
      label: "Average Views"
      value: "AVG"}
    allowed_value: {
      label: "Maximum Views"
      value: "MAX"}
    allowed_value: {
      label: "Minimum Views"
      value: "MIN"}
  }
  parameter: watch_time_measure_picker {
    description: "Analyze Watch_time"
    type: unquoted
    allowed_value: {
      label: "Total Watch_time"
      value: "SUM"}
    allowed_value: {
      label: "Average Watch_time"
      value: "AVG"}
    allowed_value: {
      label: "Maximum Watch_time"
      value: "MAX"}
    allowed_value: {
      label: "Minimum Watch_time"
      value: "MIN"}
  }

  measure: view_metric {
    description: "Use with view measure picker"
    type: number
    label_from_parameter: view_measure_picker
    sql: {% parameter view_measure_picker %}(${views}) ;;
  }
  measure: watch_time_metric {
    description: "Use with watch_time measure picker"
    type: number
    label_from_parameter: watch_time_measure_picker
    sql: {% parameter watch_time_measure_picker %}(${watch_time_minutes}) ;;
  }
}

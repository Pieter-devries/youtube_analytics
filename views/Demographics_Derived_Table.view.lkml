
view: demographics_dt {
  derived_table: {
      sql:
          SELECT
          row_number() OVER(ORDER BY _DATA_DATE) AS prim_key,
          *
          FROM channel_demographics_a1_daily_first
          WHERE {% condition date_filter %} CAST(_DATA_DATE as timestamp) {% endcondition %}　;;
    }

    dimension: prim_key {
      type: number
      primary_key: yes
      sql: ${TABLE}.prim_key ;;
  }

  filter: date_filter {
    type: date
  }

  dimension_group: _data {
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
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
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
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;
  }

  dimension: age2 {
    type: string
    sql: ${age_group} ;;
  }

  filter: age_filter {
    type: string
    suggest_dimension: age2
    sql: {% condition age_filter %} ${age2} {% endcondition %} ;;
    }

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: views_percentage {
    type: number
    sql: ${TABLE}.views_percentage ;;
  }

  measure: count {
    type: count
    drill_fields: [user_details*]
  }

set: user_details {
  fields: [age_group,gender,subscribed_status]
}
}

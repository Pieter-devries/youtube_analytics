explore: streamlined_data {}

view: streamlined_data {
  derived_table: {
    sql:
    SELECT *
    FROM `looker-dcl-data.pieteryoutube.streamlined_data`
    WHERE EXTRACT(YEAR FROM date) = EXTRACT(YEAR FROM CURRENT_DATE())
    ;;
  }

  # sql_table_name: `looker-dcl-data.pieteryoutube.streamlined_data`    ;;

  # parameter: date_selector {
  #   label: "集計日の指定"
  #   type: date_time
  # }

  # dimension: param_value {
  #   sql: {% parameter date_selector %} ;;
  # }

  # dimension: receivable_status {
  #   label: "ステータス"
  #   sql:
  #   CASE WHEN date({% parameter date_selector %}) < ${date_date} THEN 'Status 1'
  #   ELSE 'Status 2'
  #   END ;;
  #   }

  filter: test_liquid_labels {
    type: string
    default_value: "test"
  }

  dimension: picture {
    sql: 1 ;;
    html: <img src="https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2020/05/looker-logo-google_1200x630-960x504.png"/> ;;
  }

  dimension: action_test_works {
    type: string
    sql: 1 ;;
    action: {
      label: "ping action test"
      url: "https://us-central1-looker-dcl-data.cloudfunctions.net/looker_action_test"
      param: {
        name: "test"
        value: "{{value}}"
      }
    }
  }
  dimension: action_test_fails {
    type: string
    sql: 1 ;;
    action: {
      label: "ping action test"
      url: "https://us-central1-looker-dcl-data.cloudfunctions.net/looker_action_test_fails"
      param: {
        name: "test"
        value: "{{value}}"
      }
    }
  }

  measure: test_liquid_label_measure {
    type: sum
    label:
    "
    {% if streamlined_data.test_liquid_labels._is_filtered and _filters['streamlined_data.test_liquid_labels'] != 'test'%}
    filtered and not-test
    {% elsif _filters['streamlined_data.test_liquid_labels'] == 'test' %}
    test
    {% else %}
    not filtered
    {% endif %}
    "
    sql: ${views} ;;
  }

#####
  filter: page_1_page_location_filter {
    view_label: "(RC)マクロファネル"
    group_label: "マクロファネル"
    description: "page1のpage_location用のフィルタ"
  }

  filter: page_1_event_name_filter {
    view_label: "(RC)マクロファネル"
    group_label: "マクロファネル"
    default_value: "page_view"
    description: "page1のevent_name用のフィルタ"
  }

  measure: count_page1_user_pseudo_id {
    view_label: "(RC)マクロファネル"
    group_label: "マクロファネル"
    label: "{% if page_1_event_name_filter._is_filtered and _filters['page_1_event_name_filter'] != '\"page_view\"' %}
    {{_filters['page_1_event_name_filter']}}のUU
    {% elsif page_1_page_location_filter._is_filtered %}
    {{_filters['page_1_page_location_filter']}}のUU
    {% else %}
    Page 1 UU
    {% endif %}"
    type: count_distinct
    sql: ${views} ;;
  }

#####

  dimension: average_view_duration_percentage {
    type: number
    sql: ${TABLE}.average_view_duration_percentage ;;
  }

  dimension: average_view_duration_seconds {
    type: number
    sql: ${TABLE}.average_view_duration_seconds ;;
  }

  dimension: comments {
    type: number
    sql: ${TABLE}.comments ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension_group: date {
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
    datatype: datetime
    sql: ${TABLE}.date ;;
  }

  dimension: dislikes {
    type: number
    sql: ${TABLE}.dislikes ;;
  }

  dimension: likes {
    type: number
    sql: ${TABLE}.likes ;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: shares {
    type: number
    sql: ${TABLE}.shares ;;
  }

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: html_test {
    sql: ${subscribed_status} ;;
    html:
    {% if value != "subscribed" %}
    <font color="red"> {{rendered_value}} </font>
    {% else %}
    {{rendered_value}}
    {% endif %};;
  }

  dimension: subscribers_gained {
    type: number
    sql: ${TABLE}.subscribers_gained ;;
  }

  dimension: subscribers_lost {
    type: number
    sql: ${TABLE}.subscribers_lost ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: video_name {
    type: string
    sql: ${TABLE}.video_name ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  dimension: watch_time_minutes {
    type: number
    sql: ${TABLE}.watch_time_minutes ;;
  }

  measure: count {
    type: count
    drill_fields: [video_name]
  }
}

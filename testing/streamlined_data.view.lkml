explore: streamlined_data {
  # label: "{% if _model.name == 'test' %} Bob {% else %} Jack {% endif %}"
  join: rank_views_by_data {
    sql_on: ${streamlined_data.subscribed_status} = ${rank_views_by_data.subscribed_status} ;;
    relationship: one_to_one
  }
  join: week_days {
    sql_on: ${week_days.day_choice} = CAST(${streamlined_data.date_date} AS STRING) ;;
    relationship: many_to_one
  }

  sql_always_where:
  CASE
    WHEN ${streamlined_data.week_start} IS NOT NULL
    THEN ;;
}

view: rank_views_by_data {
  derived_table: {
    sql:
    SELECT
    subscribed_status,
    RANK() OVER (ORDER BY COALESCE(SUM(views), 0) DESC) AS rank
    FROM `looker-dcl-data.pieteryoutube.streamlined_data`
    WHERE EXTRACT(YEAR FROM date) = EXTRACT(YEAR FROM CURRENT_DATE())
    GROUP BY 1
    ;;

  }

# dimension_group: date {
#   type: time
#   timeframes: [raw]
#   sql: ${TABLE}.date ;;
# }

  dimension: subscribed_status {
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: rank {
    sql: ${TABLE}.rank ;;
  }
}
view: week_days {
  derived_table: {
    sql:
      SELECT date
      FROM ${streamlined_data.SQL_TABLE_NAME} as streamlined_data
      {% if streamlined_data.week_start._is_filtered %}
        WHERE date BETWEEN {{ _filters['streamlined_data.week_start'] | sql_quote  }} AND
              DATE_ADD(DATE({{ _filters['streamlined_data.week_start'] | sql_quote  }}), INTERVAL 7 DAY)
      {% endif %} ;;

    # date between DATE({{ streamlined_data.week_start._value }}) AND DATE_ADD(DATE({{ streamlined_data.week_start._value }}), INTERVAL 7 DAY);;
    #   explore_source: streamlined_data {
    #     column: week_start {}
    #     derived_column: day_choice {
    #       sql: (SELECT date from UNNEST(GENERATE_DATE_ARRAY(DATE(week_start),DATE_ADD(DATE(week_start), INTERVAL 7 DAY))) as date) ;;
    #     }
    #   bind_filters: {
    #     from_field: week_days.week_start
    #     to_field: streamlined_data.week_start
    #   }
    #   filters: []
    #   }
    }
    dimension: day_choice {
      type: string
      suggest_persist_for: "5 seconds"
      sql: left(CAST(date_trunc(${TABLE}.date, DAY) AS STRING),10);;
    }
  }

  view: streamlined_data {
    sql_table_name: `looker-dcl-data.pieteryoutube.streamlined_data` ;;


### DATE FILTER
    dimension: week_start {
      suggest_persist_for: "5 seconds"
      type: string
      group_label: "test_dim"
      sql: left(CAST(date_trunc(${TABLE}.date, WEEK(SUNDAY)) AS STRING),10) ;;
    }
    parameter: week_choice {
      suggest_persist_for: "5 seconds"
      type: string
      suggest_dimension: week_start
      full_suggestions: yes
    }

### DATE FILTER

    # sql_table_name: `looker-dcl-data.pieteryoutube.streamlined_data`    ;;

    dimension: user_attribute {
      type: string
      sql:
      {% if _user_attributes['role'] == 'admin' %}
      ${country_code}
      {% elsif _user_attributes['role'] == 'user' %}
      ${date_year}
      {% endif %}
      ;;
    }

    measure: total_amount {
      type: sum
      value_format_name: usd
      sql: ${views} ;;
      html: @{negative_format} ;;
    }

    dimension: timestamp_test {
      type: date_time
      sql: CURRENT_TIMESTAMP() ;;
    }

    dimension: timestamp_test_2 {
      type: date_time
      sql: TIMESTAMP(EXTRACT(DATETIME FROM CURRENT_TIMESTAMP()), 'Asia/Tokyo') ;;
    }


    dimension: html_br_test {
      description: "control and treatment"
      sql: concat("line1: ",
          "value", "\nLine2: ",
          "value") ;;
      html: {{ value | newline_to_br }} ;;
    }

    dimension: new_line_sql {
      sql: "line1: value\nLine2: value" ;;
    }

    dimension: html_br_withoutliquid_test {
      description: "control and treatment"
      sql: REPLACE(${new_line_sql}, "\n", ",") ;;
      html:
          {% assign lines = value | split: "," %}
          {% for line in lines %}
          {{ line }} <br />
          {% endfor %}
          ;;
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

    # dimension: liq_num {
    #   sql: 1 ;;
    #   html:
    #   {% assign bob = 10 %}
    #   {% assign jack = 10 %}
    #   {% if (bob | plus: jack) > 1 %}
    #   hi
    #   {% endif %}
    #   ;;
    # }

    dimension: liq_num2 {
      sql: 1 ;;
      html:
          {% assign bob = 10 %}
          {% assign jack = 10 %}
          {% assign sally = bob | plus: jack%}
          {% if sally > 1 %}
          hi
          {% endif %}
          ;;
    }


    dimension: sample_data {
      sql:
          CASE
          WHEN ${likes} = 1 THEN "hi"
          WHEN ${likes} = 2 THEN "hip"
          WHEN ${likes} = 3 THEN "hipe"
          WHEN ${likes} = 4 THEN "hiped"
          WHEN ${likes} = 5 THEN "hipeds"
          WHEN ${likes} = 6 THEN "hipacs"
          ELSE "h"
          END
          ;;
    }


    dimension: raw_data {
      type: date_raw
      sql: ${TABLE}.date ;;
    }

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
      sql: 2 ;;
      action: {
        label: "ping action test"
        url: "https://test-mlms43ancq-an.a.run.app"
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
        month_name,
        quarter,
        year,
        month_num,
        fiscal_month_num,
        fiscal_year
      ]
      datatype: datetime
      sql: ${TABLE}.date ;;
    }

    dimension: yearmonth {
      type: string
      sql: CAST(${TABLE}.date AS STRING FORMAT 'YYYY/MM') ;;
    }
    dimension: fiscal_year {
      type: string
      sql: CAST(CASE WHEN EXTRACT(MONTH FROM ${TABLE}.date)<= 3 THEN EXTRACT(YEAR FROM ${TABLE}.date) -1 ELSE EXTRACT(YEAR FROM ${TABLE}.date) END AS STRING);;
    }

    # dimension: week_start {
    #   type: string
    #   sql:
    #       CASE WHEN DATE_SUB(CURRENT_DATE(), INTERVAL 200 DAY) <
    #       ${date_raw} THEN ${date_week}
    #       ELSE null end;;
    # }
#DATE(left(${date_week},4),SUBSTR(${date_week},5,2),RIGHT(${date_week},2)
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
      order_by_field: subscribed_status
    }

    dimension: shares {
      type: number
      sql: ${TABLE}.shares ;;
    }

    dimension: subscribed_status {
      type: string
      sql: ${TABLE}.subscribed_status ;;
      html:
          {% if subscribed_status._value == "not_subscribed" %}
          <p style="background-color: blue; color: white">{{ rendered_value }}</p>
          {% elsif subscribed_status._value == "subscribed" %}
          <p style="background-color: green; color: white">{{ rendered_value }}</p>
          {% else %}
          {{ rendered_value }}
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

    dimension: all_views {
      type: number
      sql: (SELECT COUNT(views) FROM `looker-dcl-data.pieteryoutube.streamlined_data`) ;;
    }

    dimension: watch_time_minutes {
      type: number
      sql: ${TABLE}.watch_time_minutes ;;
    }

    measure: count {
      type: count
      drill_fields: [video_name]
      html:
      {% if value < total_views._value  %}
         <p style="background-color: blue">{{ rendered_value }}</p>
       {% else %}
         {{ rendered_value }}
       {% endif %};;

    }

    measure: total_views {
      type: sum
      sql: ${views} ;;
      # html:
      # <ul>
      # <li> value: {{ value }} </li>
      # <li> count: {{ count._value }} </li>
      # </ul>
      # ;;
      # link: {
      #   label: "xxx"
      #   url: "https://www.google.com"
      # }

      # html: <a href="https://www.google.com">{{value}}</a> ;;
    }

    measure: html_measure {
      type: number
      sql: sum(1) ;;
      html: {{ count._value | minus: total_views._value }} ;;
    }

    measure: last_year_ {
      type: count
    }

    measure: sub_label {
      type: count
      label:
      "
      {{ streamlined_data.subscribed_status._value }}
      "
    }

    measure: xxx {
      view_label: "日本語です"
      group_label: "{%if _explore._name == 'test_explore' %}コレコレ{% else %}{% endif %}"
      group_item_label: "{%if _explore._name == 'test_explore' %}コレコレ{% else %}{% endif %}"
      label: "このこの"
    }

## parameter_value in measure test ##
    parameter: connected_table_name {
      type: unquoted
      label: "集計年度"
      allowed_value: {label:"2022年度" value:"data_list_2022"}
      allowed_value: {label:"2021年度" value:"data_list_2021"}
    }

    dimension_group: param_sql_test_dim {
      sql:
            {% if connected_table_name._parameter_value contains '2021' %}
            1
            {% else %}
            2
            {% endif %};;
    }

## dashboard_url

    dimension: dashboard_url {
      sql: '{{_explore._dashboard_url}}' ;;
    }

  }

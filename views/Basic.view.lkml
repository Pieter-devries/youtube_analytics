# I have deleted annotation related data, because annotations are annoying and I don't use them!
# I have deleted avg/perc type data that is aggregated in the YT database, because they come as dimensions, I recreate the needed ones as measures


view: channel_basic_a2_daily_first {
  view_label: "Basic"
  derived_table: {
    datagroup_trigger: youtube_transfer
    sql:
          SELECT
          row_number() OVER(ORDER BY _DATA_DATE) AS prim_key,
          *,
--          max(date) as max_date,
--          min(date) as min_date
          FROM channel_basic_a2_daily_first
  --        GROUP BY 2
  ;;
  }

  drill_fields: [_data_date,country_code,views]

  filter: number_filter {
    type: number
    default_value: ">="
  }
  filter: date_filter {
    type: date
    default_value: ""
  }

  dimension: prim_key {
    hidden: yes
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }

  dimension: vid {
    hidden: yes
    type: string
    sql: ${TABLE}.vid ;;
  }

  dimension: more_details {
    type: string
    sql: "For more details.." ;;
    html: <div style= "width:100%; text-alignlast_modifiedcentre;"> <details>
          <summary style="outline:none">{{ more_details.linked_value}}</summary>
           <ul>
          <li>Total views: {{channel_basic_a2_daily_first.views._linked_value}} </li>
          <li>Subscribers Gained: {{channel_basic_a2_daily_first.subscriber_change._linked_value}} </li>
          <li>Time Watched: {{channel_basic_a2_daily_first.watch_time_hours._linked_value}} </li>

           </ul>

          </details>
          </div>
          ;;
  }


# ------------
#  Dates
# ------------


  dimension_group: _data {
    group_label: "Date"
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_week,
      day_of_week_index,
      week,
      month,
      month_name,
      month_num,
      quarter,
      day_of_year,
      week_of_year,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }
 　
  dimension: weeknum2 {
    type: date
    sql: date(extract(year from ${TABLE}._DATA_DATE),extract(month from ${TABLE}._DATA_DATE),1) ;;
}
 #(月初のweek_of_year) - (その日のweek_of_year) + 1
  dimension: weeknum {
    type: number
    sql: CASE
          WHEN ${_data_week_of_year} > 25 THEN ${_data_week_of_year} - 25
          WHEN ${_data_week_of_year} > 20 THEN ${_data_week_of_year} - 20
          WHEN ${_data_week_of_year} > 15 THEN ${_data_week_of_year} - 15
          WHEN ${_data_week_of_year} > 9 THEN ${_data_week_of_year} - 9
          WHEN ${_data_week_of_year} > 5 THEN ${_data_week_of_year} - 5
          ELSE ${_data_week_of_year}
         END;;
  }

  measure: the_latest_date {
    type: date
    sql: max(CAST(${_data_date} as timestamp)) ;;
  }

  measure: the_earliest_date {
    type: date
    sql: min(CAST(${_data_date} as timestamp)) ;;
  }

  measure:  diff_days{
    type: number
    sql: date_diff(${the_latest_date},${the_earliest_date},day) ;;
  }

#   dimension_group: up_time {
#     type: duration
#     intervals: [day,week, year]
#     sql_start: ${the_earliest_date} ;;
#     sql_end: ${the_latest_date} ;;
#   }


  dimension_group: _latest {
    hidden: yes
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

  dimension: test_vid {
    label: "{% if _model._name == 'thelook' %} dontworry {% else %} superlongteststuff {% endif %}"
    type: string
    sql: ${video_id} ;;
    drill_fields: [detail*]
    link: {
      url:"{{link}}&sorts=genre_total.genre+desc"
      }
  }

  measure: testing_views {
    label: "{% if _model._name == 'thelook' %} dontworry {% else %} superlongteststuff {% endif %}"
    type: sum
    sql: ${view_num} ;;
    drill_fields: [detail*]
    link: {
      url:"{{link}}&sorts=genre_total.genre+desc"
    }
  }

  set: detail {
    fields: [video_info.title,genre_total.genre,views,comments]
    }
# ------------
#  DIMENSIONS
# ------------

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: channel_id {
    hidden: yes
    type: string
    sql: ${TABLE}.channel_id ;;
  }

  dimension: country_code {
    description: "double digits"
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: html_test {
    hidden:  yes
    sql: ${country_code} ;;
    html: {"country": "{{value}}","video_id": "{{video_id._value}}"} ;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  measure: latest_date {
    sql: MAX(${_data_raw});;
  }

  measure: card_clicks {
    group_label: "Card"
    type: sum
    sql: ${TABLE}.card_clicks ;;
  }

  measure: card_impressions {
    group_label: "Card"
    type: sum
    sql: ${TABLE}.card_impressions ;;
  }

  measure: card_teaser_clicks {
    group_label: "Card"
    type: sum
    sql: ${TABLE}.card_teaser_clicks ;;
  }

  measure: card_teaser_impressions {
    group_label: "Card"
    type: sum
    sql: ${TABLE}.card_teaser_impressions ;;
  }

 dimension: comm {
   sql: ${TABLE}.comments ;;
 }

  measure: comments {
    group_label: "Comments"
    type: sum
    sql: ${comm} ;;
  }

  measure: view_per_comments {
    group_label: "Views"
    type: number
    sql: ${views}/nullif(${comments},0) ;;
    value_format: "#.00"
  }

  measure: dislikes {
    group_label: "Likes"
    type: sum
    sql: ${TABLE}.dislikes ;;
  }

  dimension: like_dim {
    group_label: "Likes"
    sql: ${TABLE}.likes ;;
    type: number
    html:
    {% assign param = target_id._parameter_value %}
    {% if param == value %}
     {{'*'| append: value }}
    {% else %}
    {{ value }}
    {% endif %}
    ;;
  }

  measure: likes {
    group_label: "Likes"
    type: sum
    sql: ${TABLE}.likes ;;
#     html:
#     {% if value > target_id._parameter_value %}
#     {{ '*' | append: value }}
#     {% else %}
#     {{ value }}
#     {% endif %}
#     ;;
  }

  parameter: target_id {
    type: number
  }

  measure: like_change {
    group_label: "Likes"
    type: number
    sql: ${likes}-${dislikes};;
  }

  measure: like_change_per_video {
    group_label: "Video"
    type: number
    sql: ${like_change}/${count_videos};;
    value_format: "#.00"
  }

  measure: sub_change_per_video {
    group_label: "Video"
    sql: ${subscriber_change}/${count_videos} ;;
    value_format: "#.00"
  }

  measure: comment_per_video {
    group_label: "Video"
    sql: ${comments}/${count_videos} ;;
    value_format: "#.00"
  }

  measure: view_per_like {
    group_label: "Views"
    type: number
    sql: ${views}/nullif(${likes},0) ;;
    value_format: "#.00"
  }

  measure: red_views {
    group_label: "Red"
    type: sum
    sql: ${TABLE}.red_views ;;
  }

  measure: red_watch_time_minutes {
    group_label: "Red"
    type: sum
    sql: ${TABLE}.red_watch_time_minutes,2 ;;
    value_format: "#.00"
  }

  measure: shares {
    group_label: "Shares"
    type: sum
    sql: ${TABLE}.shares ;;
  }

  measure: subscribers_gained {
    group_label: "Subscription"
    type: sum
    sql: ${TABLE}.subscribers_gained ;;
    drill_fields: [video_info.video_name,vid_stats*]
  }


  measure: subscribers_lost {
    group_label: "Subscription"
    type: sum
    sql: ${TABLE}.subscribers_lost ;;
    drill_fields: [video_info.video_name,vid_stats*]
  }

  measure: subscriber_change {
    group_label: "Subscription"
    type: number
    sql: ${subscribers_gained}-${subscribers_lost} ;;
    drill_fields: [video_info.video_name,vid_stats*]
  }

#I chose to calculate based on subscribers gained, to know speed of new subscriber acquisition
  measure: view_per_sub {
    group_label: "Views"
    type: number
    sql: ${views}/nullif(${subscribers_gained},0) ;;
    value_format: "#.00"
  }

  measure: videos_added_to_playlists {
    group_label: "Playlist"
    type: sum
    sql: ${TABLE}.videos_added_to_playlists ;;
  }

  measure: videos_removed_from_playlists {
    group_label: "Playlist"
    type: sum
    sql: ${TABLE}.videos_removed_from_playlists ;;
  }

  dimension: view_num {
    hidden: yes
    type: number
    sql: ${TABLE}.views ;;
  }

  measure: views {
    group_label: "Views"
    type: sum
    sql: ${view_num} ;;
    # link: {
    #    label: "View Indepth"
    #    url: "/dashboards/7?VideoID={{[video_id | url_encode}}&Title={{title | url_encode}}"
    # }
  }

  dimension: watch_time_min {
    hidden: yes
    type: number
    sql: ${TABLE}.watch_time_minutes ;;
  }
  measure: watch_time_minutes {
    group_label: "Watch Time"
    type: sum
    sql: ${watch_time_min} ;;
    value_format: "#,###"
  }

  measure: watch_time_hours {
    group_label: "Watch Time"
    type: sum
    sql: ${watch_time_min}/60 ;;
    value_format: "#,###"
  }

  dimension_group: watch_time {
    type: time
    timeframes: [second, minute, hour] # valid timeframes described below
    sql: ${watch_time_min} ;;  # often this is a single database column
    datatype: epoch # defaults to datetime
    convert_tz: yes   # defaults to yes
  }

  measure: avg_watch_time {
    group_label: "Watch Time"
    type: number
    sql: (${watch_time_minutes}/NULLIF(${views},0)) ;;
    value_format: "#.00"
  }

  dimension: watch_tiers {
    group_label: "Watch Time"
    case: {
      when: {
        sql: ${watch_time_min} < 5  ;;
        label: "Short"
      }
      when: {
        sql: ${watch_time_min} < 10 ;;
        label: "Medium"
      }
      when: {
        sql: ${watch_time_min} < 15 ;;
        label: "Long"
      }
      else: "Jumbo-Long"
    }
  }

  measure: count_videos {
    group_label: "Video"
    type: count_distinct
    sql: ${video_id} ;;
  }

  measure: view_per_video{
    group_label: "Video"
    type: number
    sql: ${views}/${count_videos} ;;
    value_format: "#.00"
    html: {% if genre_total.genre._value == 'Action' %}
      <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif genre_total.genre._value == 'Adventure' %}
      <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
;;
  }

  measure: count {
    type: count
    drill_fields: [vid_stats*]
  }

  measure: running_count {
    type: running_total
    sql: ${count} ;;
    direction: "column"
    drill_fields: [vid_stats*]
  }

  measure: case_when_test {
    type: number
    sql: CASE WHEN ${count_videos} < 5 THEN ${views} * 10
              WHEN ${count_videos} < 10 THEN ${views} * 5
              ELSE null END;;
    label: "Test"
#    value_format: "# ##0"
  }

  measure: key_points {
    description: "Combined Views/Subs/Likes/Shares/Comments to give a score"
    type: number
    sql: ((${views}*1)+(${likes}*10)+(${subscribers_gained}*100)+(${shares}*100))-((${dislikes}*20)+(${subscribers_lost}*200)) ;;
    drill_fields: [vid_stats*]
  }

  set: vid_stats {
    fields: [video_info.title,views,subscriber_change,like_change,watch_time_minutes,comments,shares]
  }




# ----------
# Random
# ----------


measure: combo_metric {
  label: "Testing Combo Metric"
  description: "Views and Key Points"
  type: number
  sql: ${views}  ;;
  value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
  html: {{rendered_value}} {{key_points._value}} ;;
}

  parameter: metric_chooser {
    description: "Choose Type with Chooser"
    type: string
    allowed_value: {
      label: "Total Views"
      value: "views"
    }
    allowed_value: {
      label: "Average Watch Time"
      value: "avg_watch_time"
    }
    allowed_value: {
      label: "Subscriber Change"
      value: "subscriber_change"
    }
    allowed_value: {
      label: "Shares"
      value: "shares"
    }
    allowed_value: {
      label: "Like Change"
      value: "like_change"
    }
    allowed_value: {
      label: "Key_Points"
      value: "key_points"
    }
  }

  measure: dynamic_measure {
    description: "Use with Metric_Picker Filter Only"
    type: number
    label_from_parameter: metric_chooser
    sql:    CASE
      WHEN {% parameter metric_chooser %} = 'views'
        THEN ${views}
      WHEN {% parameter metric_chooser %} = 'avg_watch_time'
        THEN ${avg_watch_time}
      WHEN {% parameter metric_chooser %} = 'subscriber_change'
        THEN ${subscriber_change}
        WHEN {% parameter metric_chooser %} = 'shares'
        THEN ${shares}
        WHEN {% parameter metric_chooser %} = 'like_change'
        THEN ${like_change}
        WHEN {% parameter metric_chooser %} = 'key_points'
        THEN ${key_points}
      ELSE NULL
    END ;;
  }

  measure: test_views {
    type: average
    sql: ${TABLE}.views ;;
    value_format_name: decimal_0
    link: {
      label: "dashboard"
      url:"/dashboards/5?"
    }}

  set: test {
    fields: [channel_basic_a2_daily_first.*]
  }

  parameter: date_granularity {
    type: unquoted
    allowed_value: { label: "Day" value: "day" }
    allowed_value: { label: "Month" value: "month" }
    allowed_value: { label: "Year" value: "year" }
  }

  dimension: date {
    label_from_parameter: date_granularity
#     "      {% if date_granularity._parameter_value == 'day' %}
#     ${_data_date}
#     {% elsif date_granularity._parameter_value == 'month' %}
#     ${_data_month}
#     {% elsif date_granularity._parameter_value == 'year' %}
#     ${_data_year}
#     {% else %}
#     Other
#     {% endif %}"
    sql:
      {% if date_granularity._parameter_value == 'day' %}
      ${_data_date}
      {% elsif date_granularity._parameter_value == 'month' %}
      ${_data_month}
      {% elsif date_granularity._parameter_value == 'year' %}
      ${_data_year}
      {% else %}
      ${_data_date}
      {% endif %};;
  }
  # For Amazon Redshift
  filter: this_period_filter {
    type: date
    description: "Use this filter to define the current and previous period for analysis"
    sql: ${period} IS NOT NULL ;;
  }
# ${_data_raw} is the timestamp dimension we are building our reporting period off of

  dimension: period {
    type: string
    description: "The reporting period as selected by the This Period Filter"
    sql:
        CASE
          WHEN {% date_start this_period_filter %} is not null AND {% date_end this_period_filter %} is not null /* date ranges or in the past x days */
            THEN
              CASE
                WHEN CAST(${_data_raw} as timestamp) >= {% date_start this_period_filter %}
                  AND CAST(${_data_raw} as timestamp) <= {% date_end this_period_filter %}
                  THEN 'This Period'
                WHEN CAST(${_data_raw} as timestamp) >= DATE_ADD(day,-1*DATE_DIFF(day,{% date_start this_period_filter %}, {% date_end this_period_filter %} ) + 1, DATE_ADD(day,-1,{% date_start this_period_filter %} ) )
                  AND CAST(${_data_raw} as timestamp) <= DATE_ADD(day,-1,{% date_start this_period_filter %} )
                  THEN 'Previous Period'
              END
          END ;;
  }

    parameter: yesno_param {
      hidden: yes
      view_label: "test"
      type: string
      allowed_value: {
        label: "Yes"
        value: "Yes"
      }
      allowed_value: {
        label: "No"
        value: "No"
      }
    }

    measure: yesno_measure {
      hidden: yes
      view_label: "test"
      type: sum
      value_format: "$#,##0"
      sql: ${view_num} ;;
      link: {
        label: "Facilty"
        url: "/explore/thesis_cool/channel_basic_a2_daily_first?fields=channel_basic_a2_daily_first.yesno_measure&f[channel_basic_a2_daily_first.yesno_param]=channel_basic_a2_daily_first.yesno_param._parameter_value"
      }
    }
    #https://localhost:9999/explore/thesis_cool/channel_basic_a2_daily_first?fields=channel_basic_a2_daily_first.yesno_measure&f[channel_basic_a2_daily_first.yesno_param]=Yes&vis=%7B%7D&filter_config=%7B%22channel_basic_a2_daily_first.yesno_param%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded

### param stuff
    dimension: comment_num {
      sql: ${TABLE}.comments ;;
    }
    parameter: bucket_1 { view_label: "Bucket" type: number}
    parameter: bucket_2 { view_label: "Bucket" type: number}
    parameter: bucket_3 { view_label: "Bucket" type: number}
    parameter: bucket_4 { view_label: "Bucket" type: number}
    dimension: comment_bucket{
      view_label: "Bucket"
      sql:
          {% assign bucket_string_1 = bucket_1._parameter_value | append: "," %}
          {% assign bucket_string_2 = bucket_2._parameter_value | append: "," %}
          {% assign bucket_string_3 = bucket_3._parameter_value | append: "," %}
          {% assign bucket_string_4 = bucket_4._parameter_value %}
          {% assign bucket_string = '0,' | append: bucket_string_1 | append: bucket_string_2 | append: bucket_string_3 | append: bucket_string_4 %}
          {% assign bucket_array = bucket_string | remove: ",NULL" | split: "," %}
          {% assign bucket_array_length = bucket_array.size | minus: 1 %}
          CASE
          {% for i in (1..bucket_array_length) %}
          {% assign j = i | minus: 1 %}
            WHEN ${comment_num} < {{ bucket_array[i] }} THEN '{{i}}: {{ bucket_array[j] }} < N < {{ bucket_array[i] }}'
          {% endfor %}
          ELSE
            '5: Unknown'
          END ;;
      html: {{ rendered_value | slice: 3, rendered_value.size }} ;;
    }

    parameter: date_format {
      hidden: yes
      view_label: "test"
      type: string
      allowed_value: { value: "%d %m %Y" label: "dd/mm/yyyy" }
      allowed_value: { value: "%m %d %Y" label: "mm/dd/yyyy" }
      allowed_value: { value: "%Y %m %d" label: "yyyy/mm/dd" }
    }

    dimension: date_formatted {
      hidden: yes
      view_label: "test"
      type: date
      sql: cast(${_data_date} as timestamp) ;;
      html: {{ rendered_value | date: date_format._parameter_value }} ;;
    }


    dimension: formatted_date {
      hidden: yes
      view_label: "test"
      type: date
#      sql:       FORMAT_DATE({% date_format._parameter_value %},CAST(${_data_date} as timestamp)) ;;
     sql: {% if date_format._parameter_value == "%d %m %Y" %}
     FORMAT_TIMESTAMP("%d %m %Y",CAST(${_data_date} as timestamp))
    {% elsif date_format._parameter_value == "%m %d %Y" %}
     FORMAT_TIMESTAMP("%m %d %Y",CAST(${_data_date} as timestamp))
    {% else %}
     FORMAT_TIMESTAMP("%Y %m %d",CAST(${TABLE}._DATA_DATE as timestamp))
    {% endif %} ;;

    }





}

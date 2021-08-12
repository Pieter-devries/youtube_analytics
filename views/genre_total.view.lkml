view: genre_total {
  sql_table_name: YoutubeData.total_genre ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
    drill_fields: [video_info.title,video_info.video_name,Basic.vid_stats*]
  }

  dimension: genre1 {
    hidden: yes
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id    ;;
  }

  parameter: genre_chooser {
    hidden: yes
    type: unquoted
  }

  dimension: action_adventure {
    hidden: yes
    type: string
    sql: ${genre} ;;
    suggestions: ["Action","Adventure"]
  }

  dimension: htmladventure {
    type: string
    sql: ${genre} ;;
    suggestions: ["Action","Adventure"]
    html:

    <button class="button" style=" background-color: #0079a1 ; border-color: white" >
    <a href="www.google.co.in">
    <b><font color="white">Maps</font></b>
    </a>
    </button>
   ;;
  }

  measure: test_line {
    hidden: yes
    type: number
    sql:
      (case when ${genre} = 'Action' then 30
      when ${genre} = 'Adventure' then 30
      when ${genre} = 'Mystery' then 50
      when ${genre} = 'Supernatural' then 50
      when ${genre} = 'Magic' then 80
      when ${genre} = 'Fantasy' then 80
      else 100
      end) ;;
  }

  dimension: genre_colors {
    hidden: yes
    type: string
    sql: ${genre};;
    html: {% if value == 'Adventure' %}
    <p style="color: black; background-color: indianred; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'Action' %}
    <p style="color: black; background-color: lightyellow; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: white; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: over_100 {
    type: yesno
    sql: ${video_id} = "1" OR ${genre1} = "Horror";;
#    hidden:  yes
  }
  measure: video_by_genre {
    hidden: yes
    type: count
    filters: {
      field: genre
      value: "Action, Adventure, Magic, Fantasy"
    }
    filters: {
      field: over_100
      value: "yes"
    }
  }


  measure: count {
    type: count
  }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: genre_total {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }

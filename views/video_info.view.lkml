view: video_info {
  sql_table_name: video_info ;;

  dimension_group: published_date {
    type: time
    timeframes: [
      raw,
      date,
      year,
      month,
      day_of_month,
      day_of_week,
      hour_of_day
    ]
    sql: ${TABLE}.published_date ;;
  }

  dimension_group: published_time {
    type: duration
    sql_start: TIMESTAMP(${published_date_date}) ;;  # often this is a single database column
    sql_end: TIMESTAMP(channel_basic_a2_daily_first._latest_date) ;;  # often this is a single database column
    intervals: [year, week, day] # valid intervals described below
  }

  dimension: video_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: video_url {
    hidden: yes
    type: string
    sql: ${TABLE}.video_url ;;
  }

  dimension: cleanedleft5 {
    hidden: yes
    type: number
    sql: CASE WHEN ${video_id} ~ '^([0-9]+[.]?[0-9]*|[.][0-9]+)$' THEN LEFT(${video_id},5);;
  }

  dimension: filter_jump {
    type: string
    sql: ${video_id} ;;
    link: {
      label: "For Testing to Video Dashboard"
      url: "/dashboards/6?Video_Name={{ _filters['video_info.video_name'] | url_encode}}"
      icon_url: "https://image.flaticon.com/icons/png/512/87/87578.png"
    }
  }

  dimension: full_name {
    sql: ${TABLE}.video_name ;;
}

  dimension: remove_kaigai {
    hidden: yes
       sql: TRIM(SUBSTR(replace(${full_name},"【海外の反応 アニメ】",""),0,STRPOS(replace(${full_name},"【海外の反応 アニメ】",""),"話"))) ;;
  }

  dimension: remove_pieter {
    hidden: yes
    sql: TRIM(SUBSTR(replace(${remove_kaigai},"ピーターの反応",""),0,STRPOS(replace(${remove_kaigai},"ピーターの反応",""),"話"))) ;;
  }

  dimension: remove_bracket {
    hidden: yes
    sql: TRIM(SUBSTR(replace(${remove_pieter},"【】",""),0,STRPOS(replace(${remove_pieter},"【】",""),"話"))) ;;
  }

  dimension: video_name {
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

  dimension: full_or_short {
    label: "Post - Video Name"
    sql:
    case when ${video_name} = "" then ${full_name}
         else ${video_name} end;;
  }

  dimension: episode {
    type: string
    sql: trim(SUBSTR(${TABLE}.video_name, STRPOS(${TABLE}.video_name,"話")-2,3));;
    link: {
      label: "Video URL"
      url: "https://www.youtube.com/watch?v={{ video_info.video_id._value | url_encode}}"
    }
    link: {
      label: "Video Dashboard"
      url: "/dashboards/6?Video_Name={{ video_info.video_name._value | url_encode}}"
      icon_url: "https://image.flaticon.com/icons/png/512/87/87578.png"
    }
  }

  ###test_stuff
  measure: test_count {
    type: count
    link: {
      label: "Video URL"
      url: "https://www.youtube.com/watch?v={{ _filters['video_info.video_id'] | url_encode}}"
    }
    html:
    {% if value > 10 %}
    <div style="color: black; font-size:100%; text-align:right;">{{rendered_value}}</div>
    {% else %}
    <div style="color: black; font-size:100%; text-align:right; font-weight:bold"><a href={{ link }} target="_top">{{ rendered_value }}</a></div>
    {% endif %}
    ;;
  }
  ###test_stuff

  measure: test_thumb {
    type: count
    html:   html: <img src="{{video_info.thumbnail}}" width=75 height=50 border=0 />  ;;
  }

  dimension: thumb_url {
    sql: ${thumbnail} ;;
  }

  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
    link: {
      label: "Video Dashboard"
      url: "/dashboards/6?Video_Name={{video_info.video_name._filterable_value | url_encode}}"
      icon_url: "https://image.flaticon.com/icons/png/512/87/87578.png"
      }
    link: {
      label: "Video URL"
      url: "https://www.youtube.com/watch?v={{ _filters['video_info.video_id'] | url_encode}}"
    }
    html: <img src="{{value}}" width=75 height=50 border=0 />  ;;
    drill_fields: [channel_basic_a2_daily_first.data_date,video_name,channel_basic_a2_daily_first.video_stats*]
}
#html: <a href="{{ website.url._value }}" target="_new">{{ value }}</a> ;;
    dimension: full_thumbnail {
      type: string
      sql: ${TABLE}.thumbnail ;;
      html: <img src="{{value}}" width=200 />  ;;
      drill_fields: [channel_basic_a2_daily_first.data_date,video_name,channel_basic_a2_daily_first.video_stats*]
  }

  dimension: title {
    type: string
    sql: ${TABLE}.anime_title ;;
    link: {
      label: "Video Series Dashboard"
      url: "/dashboards-next/1?Title={{filterable_value | url_encode}}"
      icon_url: "https://image.flaticon.com/icons/png/512/87/87578.png"
    }
    drill_fields: [video_name,Basic.video_stats*]
    suggest_persist_for: "30 seconds"
  }

  parameter: anime_series_name {
    suggest_dimension: title
  }


  dimension: name {
    hidden: yes
    sql: ${title} ;;
    html:
    <a href="/dashboards-next/1?Title={{ filterable_value }}&">{{ filterable_value }}</a> ;;
  }


  parameter:  test_faceted {
    suggest_dimension: video_info.video_name
  }


  dimension: title_pic {
    hidden: yes
    sql: ${title};;
    html: <img src="https://agile-peak-87852.herokuapp.com/image_search.php?q={{value | url_param_escape }}" width=200  border=0 /> ;;
  }

  dimension: episode_pic {
    hidden: yes
    sql: ${video_name};;
    html: <img src="https://agile-peak-87852.herokuapp.com/image_search.php?q={{value | url_param_escape }}" width=200  border=0 /> ;;
  }

  dimension: genre1 {
    hidden: yes
    type: string
    sql: ${TABLE}.genre_1 ;;
  }

  dimension: genre2 {
    hidden: yes
    type: string
    sql: ${TABLE}.genre_2 ;;
  }
  dimension: genre3 {
    hidden: yes
    type: string
    sql: ${TABLE}.genre_3 ;;
  }

  dimension: genre4 {
    hidden: yes
    type: string
    sql: ${TABLE}.genre_4 ;;
}

  dimension: genre_colors {
    type: string
    sql: CASE WHEN ${genre1} = 'Adventure' THEN 'Adventure'
              WHEN ${genre2} = 'Action' THEN  'Action'
              WHEN ${genre3} = 'Mystery' THEN 'Mystery'
              ELSE 'Bob' END;;
  }

  dimension: all_genres {
    type: string
    sql: ${genre1} ;;
    html: <p>{{ video_info.genre1._value }} {{ video_info.genre2._value }} {{ video_info.genre3._value }}</p> ;;
  }


  dimension: play_button {
    hidden: yes
    label: "Play Button"
    sql: ${video_id} ;;
    html: <img src="https://variable.media/wp-content/uploads/2015/12/YouTube-Play-Button.png" width=100% border=0 /> ;;
  }

  dimension: face {
    hidden: yes
    label: "Face"
    sql: ${video_id} ;;
    html: <img src="https://yt3.ggpht.com/a-/AAuE7mBt0IhShlMtdkxricRAEgoJ9o-UphIfqutjLdeq=s88-c-k-c0xffffffff-no-rj-mo" height=100% border=0 /> ;;
  }


  measure: count {
    type: count
  }
 dimension: duration {
  type: string
  sql: ${TABLE}.duration ;;
}
  measure: view_num {
    type: sum
    sql: ${TABLE}.view_num ;;
  }
  measure: like_num {
    type: sum
    sql: ${TABLE}.like_num ;;
  }
  measure: dislike_num  {
    type: sum
    sql: ${TABLE}.dislike_num ;;
  }

  measure: like_change_num {
    type: number
    sql: ${like_num}-${dislike_num} ;;
  }

  measure: comment_num{
    type: sum
    sql: ${TABLE}.comment_num ;;
  }

  dimension: test_html {
    sql: 1 ;;
    html: this is my text {{ _filters['video_info.title'] }} its from the filter ;;
  }
}

include: "*.view.lkml"

explore: created_dt {}


explore: test_conditional_where {
  view_name: streamlined_data
  conditionally_filter: {
    filters: [streamlined_data.date_date: "2021-12-12"]
    unless: [streamlined_data.date_month]
  }
}

explore: test_explore {
  extension: required
  view_name: streamlined_data

  aggregate_table: new_name {
    query:  {
      dimensions: [streamlined_data.date_date]
      measures: [streamlined_data.total_views]
    }
    materialization: {
      sql_trigger_value: 1 ;;
    }
  }
  # persist_with: test_dg
}


explore: test_sql_where {
  extends: [test_explore]
  join: second_table {
    from: streamlined_data
    type: left_outer
    sql_on: ${second_table.video_id} = ${streamlined_data.video_id} ;;
    relationship: one_to_one
    sql_where: ${second_table.date_date} = ${streamlined_data.date_date} ;;
  }
  sql_always_where: ${second_table.video_name} = ${streamlined_data.video_name} ;;
}

explore: test_dashboard_url {
  view_name: streamlined_data
  sql_always_where:
  {% if streamlined_data.dashboard_url == '1' %}
  1=1
  {% else %}
  2=2
  {% endif %}
  ;;
}

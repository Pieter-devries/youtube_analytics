include: "*.view.lkml"

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

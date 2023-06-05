- dashboard: best_episode
  title: Best Episode
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: qS1gbhvZ1b8t6vAu95lZyj
  elements:
  - title: Best Episode
    name: Best Episode
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_single_record
    fields: [channel_basic_a2_daily_first._data_date, scrape_data.playlist_name, scrape_data.episode_number,
      channel_basic_a2_daily_first.views]
    filters: {}
    sorts: [channel_basic_a2_daily_first.views desc]
    limit: 500
    show_view_names: false
    series_types: {}
    defaults_version: 1
    listen:
      Episode Number: scrape_data.episode_number
      " Data Date": channel_basic_a2_daily_first._data_date
    row: 1
    col: 0
    width: 5
    height: 5
  - name: traffic_views
    title: traffic_views
    model: thesis_cool
    explore: traffic_source
    type: looker_grid
    fields: [traffic_source.traffic_source, traffic_source.views]
    sorts: [traffic_source.views desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: New Calculation, value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_of_column_sum, table_calculation: new_calculation,
        args: [traffic_source.views], _kind_hint: measure, _type_hint: number, id: fuEDG4guQA}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      traffic_source.views: ttl views
    defaults_version: 1
    listen: {}
    row: 1
    col: 5
    width: 8
    height: 6
  - type: button
    name: button_293
    rich_content_json: '{"text":"button2","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8"}'
    row: 0
    col: 3
    width: 4
    height: 1
  - type: button
    name: button_294
    rich_content_json: '{"text":"button1","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8"}'
    row: 0
    col: 0
    width: 3
    height: 1
  filters:
  - name: Episode Number
    title: Episode Number
    type: field_filter
    default_value: NOT NULL
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: []
    field: scrape_data.episode_number
  - name: " Data Date"
    title: " Data Date"
    type: field_filter
    default_value: NOT NULL
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: []
    field: channel_basic_a2_daily_first._data_date

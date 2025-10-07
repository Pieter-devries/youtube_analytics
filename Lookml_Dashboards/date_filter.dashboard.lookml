---
- dashboard: date_filter
  title: date_filter
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: uABVxkIEJZiOTjEfydPRe7
  elements:
  - title: date
    name: date_filter
    model: test_model
    explore: streamlined_data
    type: table
    fields: [streamlined_data.video_name, streamlined_data.count]
    sorts: [streamlined_data.count desc]
    limit: 500
    hidden_fields: []
    y_axes: []
    listen:
      Week Start: streamlined_data.week_start
      Date Date: streamlined_data.date_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: 無題
    name: 無題
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_line
    fields: [scrape_data.playlist_name, scrape_data.episode_number, channel_basic_a2_daily_first.key_points]
    pivots: [scrape_data.playlist_name]
    sorts: [scrape_data.playlist_name desc, channel_basic_a2_daily_first.key_points
        desc 0]
    limit: 500
    column_limit: 5
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_series: []
    hidden_fields: []
    y_axes: []
    listen:
      Playlist Name: scrape_data.playlist_name
    row: 0
    col: 8
    width: 8
    height: 6
  filters:
  - name: Week Start
    title: Week Start
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: test_model
    explore: streamlined_data
    listens_to_filters: []
    field: streamlined_data.week_start
  - name: Playlist Name
    title: Playlist Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: popover
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: []
    field: scrape_data.playlist_name
  - name: Date_name
    title: Date_title
    type: field_filter
    default_value: 2019/02/12 to 2025/02/13
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: test_model
    explore: streamlined_data
    listens_to_filters: []
    field: streamlined_data.date_date

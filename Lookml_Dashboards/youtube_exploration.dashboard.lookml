- dashboard: youtube_data_exploration
  title: Youtube_Data_Exploration
  layout: newspaper
  preferred_viewer: dashboards
  query_timezone: user_timezone
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Video KPIs
    name: Video KPIs
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_grid
    fields: [video_info.video_name, video_info.published_date_date, channel_basic_a2_daily_first.views,
      channel_basic_a2_daily_first.avg_watch_time, channel_basic_a2_daily_first.subscriber_change,
      channel_basic_a2_daily_first.comments, channel_basic_a2_daily_first.likes, channel_basic_a2_daily_first.dislikes,
      channel_basic_a2_daily_first.shares, channel_basic_a2_daily_first.key_points]
    filters:
      channel_basic_a2_daily_first.video_id: "-NULL"
    sorts: [channel_basic_a2_daily_first.key_points desc]
    limit: 20
    query_timezone: America/Los_Angeles
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
    column_order: ["$$$_row_numbers_$$$", video_info.video_name, video_info.published_date_date,
      channel_basic_a2_daily_first.views, channel_basic_a2_daily_first.avg_watch_time,
      channel_basic_a2_daily_first.subscriber_change, channel_basic_a2_daily_first.comments,
      channel_basic_a2_daily_first.likes, channel_basic_a2_daily_first.dislikes, channel_basic_a2_daily_first.shares,
      channel_basic_a2_daily_first.key_points]
    series_column_widths:
      video_info.video_name: 328
    series_cell_visualizations:
      channel_basic_a2_daily_first.subscripter_change:
        is_active: true
      channel_basic_a2_daily_first.views:
        is_active: true
      channel_basic_a2_daily_first.watch_time_minutes:
        is_active: true
      channel_basic_a2_daily_first.comments:
        is_active: true
      channel_basic_a2_daily_first.avg_watch_time:
        is_active: true
        palette:
          palette_id: 37374e62-1e60-5e0e-babc-e127a1845c0a
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#fad464"
          - "#C2DD67"
          - "#3EB0D5"
          - "#4276BE"
          - "#592EC2"
      channel_basic_a2_daily_first.likes:
        is_active: true
      channel_basic_a2_daily_first.dislikes:
        is_active: true
        palette:
          palette_id: afd30da6-0c5e-b772-fac6-72b2f7f23402
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#8e8de6"
          - "#a49ffa"
          - "#ff85a4"
          - "#d6605e"
          - "#bf2d32"
      channel_basic_a2_daily_first.shares:
        is_active: true
      channel_basic_a2_daily_first.subscriber_change:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    hidden_fields:
    pinned_columns:
      video_info.video_name: left
    defaults_version: 1
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 7
    col: 15
    width: 9
    height: 6
  - title: Top 10 Sub Increase
    name: Top 10 Sub Increase
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_column
    fields: [video_info.thumbnail, channel_basic_a2_daily_first.subscribers_gained,
      channel_basic_a2_daily_first.subscribers_lost]
    filters:
      video_info.thumbnail: "-NULL"
    sorts: [channel_basic_a2_daily_first.subscribers_gained desc 0, channel_basic_a2_daily_first.subscribers_lost]
    limit: 10
    query_timezone: America/Los_Angeles
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_basic_a2_daily_first.subscribers_gained,
            id: channel_basic_a2_daily_first.subscribers_gained, name: Subscribers
              Gained}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      channel_basic_a2_daily_first.subscribers_gained: "#C2DD67"
      channel_basic_a2_daily_first.subscribers_lost: "#B32F37"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 13
    col: 5
    width: 10
    height: 5
  - title: Top 10 Sub Decrease
    name: Top 10 Sub Decrease
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_column
    fields: [video_info.thumbnail, channel_basic_a2_daily_first.subscribers_gained,
      channel_basic_a2_daily_first.subscribers_lost]
    filters:
      video_info.thumbnail: "-NULL"
      channel_basic_a2_daily_first.subscribers_lost: ">0"
    sorts: [channel_basic_a2_daily_first.subscribers_lost desc]
    limit: 10
    query_timezone: America/Los_Angeles
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_basic_a2_daily_first.subscribers_gained,
            id: channel_basic_a2_daily_first.subscribers_gained, name: Subscribers
              Gained}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      channel_basic_a2_daily_first.subscribers_gained: "#C2DD67"
      channel_basic_a2_daily_first.subscribers_lost: "#B32F37"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 13
    col: 15
    width: 9
    height: 5
  - name: Channel Performance - Health
    type: text
    title_text: Channel Performance - Health
    subtitle_text: Section 1
    body_text: |-
      1. HEY THIS IS MY TEST Use Viewer activity to gauge amount of views per day, and average viewer watch time.
        - Drill in to check subscription status of viewers, and demographics

      2. User Subscriber activity to gauge recent trends of video quality.
        - Individual video performance below
    row: 4
    col: 0
    width: 5
    height: 9
  - title: Viewer Activity
    name: Viewer Activity
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_area
    fields: [channel_basic_a2_daily_first._data_date, channel_basic_a2_daily_first.views,
      channel_basic_a2_daily_first.avg_watch_time]
    fill_fields: [channel_basic_a2_daily_first._data_date]
    sorts: [channel_basic_a2_daily_first._data_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: view_goal, label: View Goal, expression: '10000',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: dimension,
        _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_basic_a2_daily_first.views,
            id: channel_basic_a2_daily_first.views, name: Views}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 34, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: channel_basic_a2_daily_first.avg_watch_time,
            id: channel_basic_a2_daily_first.avg_watch_time, name: Avg Watch Time}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
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
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#3EB0D5",
        line_value: '10000', label: View Goal}]
    swap_axes: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 2
    col: 5
    width: 10
    height: 5
  - name: Video Performance - Health
    type: text
    title_text: Video Performance - Health
    subtitle_text: Section 2
    body_text: |-
      1. Use Video Series KPIs to monitor individual series' KPIs.
        - Drill in to check individual videos performance within that series.
      2. User Video KPIs to monitor individual video performance.
        - Drill in to check additional demographic or KSF information.
      3. User Top 10 Sub Inc/Decrease to get a clear idea of which individual videos have had an effect on Subscribers.
       - Drill in to check above 2.
    row: 13
    col: 0
    width: 5
    height: 5
  - title: Subscriber Trend
    name: Subscriber Trend
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_area
    fields: [channel_basic_a2_daily_first._data_date, channel_basic_a2_daily_first.subscribers_gained,
      channel_basic_a2_daily_first.subscribers_lost]
    fill_fields: [channel_basic_a2_daily_first._data_date]
    sorts: [channel_basic_a2_daily_first._data_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_basic_a2_daily_first.subscribers_gained,
            id: channel_basic_a2_daily_first.subscribers_gained, name: Subscribers
              Gained}, {axisId: channel_basic_a2_daily_first.subscribers_lost, id: channel_basic_a2_daily_first.subscribers_lost,
            name: Subscribers Lost}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: channel_basic_a2_daily_first.subscripter_change, id: channel_basic_a2_daily_first.subscripter_change,
            name: Subscripter Change}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
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
    series_types:
      channel_basic_a2_daily_first.subscripter_change: line
    point_style: none
    series_colors:
      channel_basic_a2_daily_first.subscripter_change: "#592EC2"
      channel_basic_a2_daily_first.subscribers_gained: "#87d14c"
      channel_basic_a2_daily_first.subscribers_lost: "#b25293"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#72D16D",
        line_value: '35', label: Subscriber Goal}]
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 2
    col: 15
    width: 9
    height: 5
  - title: Demographic KPIs
    name: Demographic KPIs
    model: thesis_cool
    explore: demographics_dt
    type: Sankey
    fields: [demographics_dt.gender, demographics_dt.age_group, demographics_dt.subscribed_status,
      demographics_dt.count]
    sorts: [demographics_dt.age_group]
    limit: 500
    color_range: ["#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3", "#36c1b3",
      "#b57052", "#ed69af"]
    label_type: name_value
    show_null_points: true
    series_types: {}
    listen:
      Date Filter: demographics_dt._data_date
      Series Title: video_info.title
    row: 18
    col: 15
    width: 9
    height: 6
  - name: Other KPIs
    type: text
    title_text: Other KPIs
    subtitle_text: Section 3
    body_text: |-
      1. Genre
      2. Demographic
      3. Traffic
      4. Search
    row: 18
    col: 0
    width: 5
    height: 6
  - title: Video Series KPIs
    name: Video Series KPIs
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_grid
    fields: [video_info.title, channel_basic_a2_daily_first.count_videos, channel_basic_a2_daily_first.views,
      channel_basic_a2_daily_first.subscriber_change, channel_basic_a2_daily_first.like_change,
      channel_basic_a2_daily_first.avg_watch_time, channel_basic_a2_daily_first.comments,
      channel_basic_a2_daily_first.shares, channel_basic_a2_daily_first.key_points]
    sorts: [channel_basic_a2_daily_first.key_points desc]
    limit: 20
    query_timezone: America/Los_Angeles
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
    column_order: ["$$$_row_numbers_$$$", video_info.title, channel_basic_a2_daily_first.count_videos,
      channel_basic_a2_daily_first.views, channel_basic_a2_daily_first.subscriber_change,
      channel_basic_a2_daily_first.avg_watch_time, channel_basic_a2_daily_first.comments,
      channel_basic_a2_daily_first.likes, channel_basic_a2_daily_first.dislikes, channel_basic_a2_daily_first.shares,
      channel_basic_a2_daily_first.key_points]
    series_column_widths:
      video_info.video_name: 328
      video_info.title: 230
    series_cell_visualizations:
      channel_basic_a2_daily_first.subscripter_change:
        is_active: true
      channel_basic_a2_daily_first.views:
        is_active: true
      channel_basic_a2_daily_first.watch_time_minutes:
        is_active: true
      channel_basic_a2_daily_first.comments:
        is_active: true
      channel_basic_a2_daily_first.avg_watch_time:
        is_active: true
        palette:
          palette_id: 37374e62-1e60-5e0e-babc-e127a1845c0a
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#fad464"
          - "#C2DD67"
          - "#3EB0D5"
          - "#4276BE"
          - "#592EC2"
      channel_basic_a2_daily_first.likes:
        is_active: true
      channel_basic_a2_daily_first.dislikes:
        is_active: true
        palette:
          palette_id: afd30da6-0c5e-b772-fac6-72b2f7f23402
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#8e8de6"
          - "#a49ffa"
          - "#ff85a4"
          - "#d6605e"
          - "#bf2d32"
      channel_basic_a2_daily_first.shares:
        is_active: true
      channel_basic_a2_daily_first.subscriber_change:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    pinned_columns:
      video_info.title: left
    defaults_version: 1
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 7
    col: 5
    width: 10
    height: 6
  - title: Total Views
    name: Total Views
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first.views]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 0
    col: 5
    width: 5
    height: 2
  - title: Subscriber Change
    name: Subscriber Change
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first.subscribers_gained, channel_basic_a2_daily_first.subscriber_change]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 0
    col: 15
    width: 9
    height: 2
  - title: Untitled
    name: Untitled
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.play_button]
    filters:
      video_info.play_button: "-NULL"
    sorts: [video_info.play_button]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Series Title: video_info.title
    row: 2
    col: 0
    width: 3
    height: 2
  - title: Untitled (copy)
    name: Untitled (copy)
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.face]
    filters:
      video_info.play_button: "-NULL"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Series Title: video_info.title
    row: 0
    col: 3
    width: 2
    height: 4
  - title: Latest Data
    name: Latest Data
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first._data_date]
    fill_fields: [channel_basic_a2_daily_first._data_date]
    filters:
      video_info.play_button: "-NULL"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Series Title: video_info.title
    row: 0
    col: 0
    width: 3
    height: 2
  - title: Sharing Breakdown
    name: Sharing Breakdown
    model: thesis_cool
    explore: sharing
    type: looker_column
    fields: [channel_basic_a2_daily_first._data_date, sharing.sharingservice, sharing.count]
    pivots: [sharing.sharingservice]
    fill_fields: [channel_basic_a2_daily_first._data_date]
    sorts: [sharing.sharingservice, channel_basic_a2_daily_first._data_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    column_group_spacing_ratio: 0.1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 30
    col: 15
    width: 9
    height: 7
  - title: Sharing Pie
    name: Sharing Pie
    model: thesis_cool
    explore: sharing
    type: looker_pie
    fields: [sharing.count, sharing.sharingservice]
    sorts: [sharing.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 30
    col: 5
    width: 10
    height: 7
  - title: Average Watch Time
    name: Average Watch Time
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first.avg_watch_time]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    note_state: expanded
    note_display: above
    note_text: ''
    listen:
      Date Filter: channel_basic_a2_daily_first._data_date
      Series Title: video_info.title
    row: 0
    col: 10
    width: 5
    height: 2
  - title: Genre_KPI_video
    name: Genre_KPI_video
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_grid
    fields: [genre_total.genre, genre_total.count, channel_basic_a2_daily_first.like_change,
      channel_basic_a2_daily_first.views, channel_basic_a2_daily_first.comments, channel_basic_a2_daily_first.shares,
      channel_basic_a2_daily_first.watch_time_minutes, channel_basic_a2_daily_first.subscriber_change,
      channel_basic_a2_daily_first.key_points]
    filters:
      channel_basic_a2_daily_first._data_date: after 8 weeks ago
    sorts: [watched_hours_per_video desc 0, shares_per_video desc 0, view_per_video
        desc 0, like_per_video desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: view_per_video, label: View per Video, expression: "${channel_basic_a2_daily_first.views}/${genre_total.count}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: like_per_video, label: Like per Video,
        expression: "${channel_basic_a2_daily_first.like_change}/${genre_total.count}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: subs_per_video, label: Subs per Video,
        expression: "${channel_basic_a2_daily_first.subscriber_change}/${genre_total.count}",
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: shares_per_video, label: Shares per
          Video, expression: "${channel_basic_a2_daily_first.shares}/${genre_total.count}",
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: watched_hours_per_video, label: Watched
          Hours per Video, expression: "(${channel_basic_a2_daily_first.watch_time_minutes}/${genre_total.count})/60",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: points_per_video, label: Points per
          Video, expression: "${channel_basic_a2_daily_first.key_points}/${genre_total.count}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    column_order: ["$$$_row_numbers_$$$", genre_total.genre, channel_basic_a2_daily_first.subscriber_change,
      view_per_video, like_per_video, subs_per_video, shares_per_video, watched_hours_per_video]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      like_per_video:
        is_active: true
      view_per_video:
        is_active: true
      shares_per_video:
        is_active: true
      watched_hours_per_video:
        is_active: true
      subs_per_video:
        is_active: true
      points_per_video:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: [genre_total.count, channel_basic_a2_daily_first.like_change, channel_basic_a2_daily_first.views,
      channel_basic_a2_daily_first.comments, channel_basic_a2_daily_first.shares,
      channel_basic_a2_daily_first.watch_time_minutes, channel_basic_a2_daily_first.subscriber_change]
    note_state: collapsed
    note_display: above
    note_text: ''
    title_hidden: true
    listen:
      Series Title: video_info.title
    row: 18
    col: 5
    width: 10
    height: 6
  - title: Search Cloud
    name: Search Cloud
    model: thesis_cool
    explore: traffic_source
    type: looker_wordcloud
    fields: [traffic_source.traffic_source_detail, traffic_source.views]
    filters:
      traffic_source.traffic_source: Youtube Search
      traffic_source.traffic_source_detail: "-NULL"
    sorts: [traffic_source.views desc]
    limit: 50
    query_timezone: America/Los_Angeles
    color_application: undefined
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen:
      Date Filter: traffic_source._data_date
    row: 37
    col: 5
    width: 10
    height: 7
  - title: Watch Time Cloud
    name: Watch Time Cloud
    model: thesis_cool
    explore: traffic_source
    type: looker_wordcloud
    fields: [traffic_source.traffic_source_detail, traffic_source.watch_time_minutes]
    filters:
      traffic_source.traffic_source: Youtube Search
      traffic_source.traffic_source_detail: "-NULL"
    limit: 50
    query_timezone: America/Los_Angeles
    color_application: undefined
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 37
    col: 15
    width: 9
    height: 7
  filters:
  - name: Date Filter
    title: Date Filter
    type: field_filter
    default_value: after 7 days ago
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: []
    field: channel_basic_a2_daily_first._data_date
  - name: Video Title
    title: Video Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: [Series Title]
    field: video_info.video_name
  - name: Series Title
    title: Series Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: []
    field: video_info.title

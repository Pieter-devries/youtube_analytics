- dashboard: api-sync
  title: Video_Series
  layout: newspaper
  elements:
  - title: Title_card
    name: Title_card
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.title]
    sorts: [video_info.title]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Title: video_info.title
    row: 0
    col: 0
    width: 3
    height: 4
  - title: Video KPI
    name: Video KPI
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_grid
    fields: [video_info.video_name, channel_basic_a2_daily_first.subscriber_change,
      channel_basic_a2_daily_first.views, channel_basic_a2_daily_first.avg_watch_time,
      channel_basic_a2_daily_first.comments, channel_basic_a2_daily_first.likes, channel_basic_a2_daily_first.dislikes,
      channel_basic_a2_daily_first.shares, video_days.post_date_date]
    filters:
      channel_basic_a2_daily_first.video_id: "-NULL"
    sorts: [channel_basic_a2_daily_first.subscriber_change desc]
    limit: 20
    column_limit: 50
    query_timezone: America/Los_Angeles
    column_order: ["$$$_row_numbers_$$$", video_info.video_name, channel_basic_a2_daily_first.subscripter_change,
      channel_basic_a2_daily_first.views, channel_basic_a2_daily_first.avg_watch_time,
      channel_basic_a2_daily_first.watch_time_minutes, channel_basic_a2_daily_first.comments,
      channel_basic_a2_daily_first.likes, channel_basic_a2_daily_first.dislikes, channel_basic_a2_daily_first.shares]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
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
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Title: video_info.title
    row: 8
    col: 8
    width: 16
    height: 6
  - title: Views
    name: Views
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_area
    fields: [channel_basic_a2_daily_first._data_date, channel_basic_a2_daily_first.views,
      channel_basic_a2_daily_first.avg_watch_time]
    fill_fields: [channel_basic_a2_daily_first._data_date]
    sorts: [channel_basic_a2_daily_first._data_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_basic_a2_daily_first.views,
            id: channel_basic_a2_daily_first.views, name: Views}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: channel_basic_a2_daily_first.avg_watch_time,
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
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Title: video_info.title
    row: 2
    col: 8
    width: 8
    height: 6
  - title: Subs
    name: Subs
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
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Title: video_info.title
    row: 2
    col: 16
    width: 8
    height: 6
  - title: Total Views
    name: Total Views
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first.views, video_info.view_num]
    limit: 500
    series_types: {}
    hidden_fields:
    listen:
      Title: video_info.title
    row: 0
    col: 8
    width: 4
    height: 2
  - title: Total View Time (Hours)
    name: Total View Time (Hours)
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first.watch_time_minutes]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: view_hours, label: View Hours, expression: "${channel_basic_a2_daily_first.watch_time_minutes}/60",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    series_types: {}
    hidden_fields: [channel_basic_a2_daily_first.watch_time_minutes]
    listen:
      Title: video_info.title
    row: 0
    col: 12
    width: 4
    height: 2
  - title: Subs Gained
    name: Subs Gained
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first.subscriber_change]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Title: video_info.title
    row: 0
    col: 16
    width: 4
    height: 2
  - title: Subs Lost
    name: Subs Lost
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [channel_basic_a2_daily_first.subscribers_lost]
    limit: 500
    column_limit: 50
    series_types: {}
    listen:
      Title: video_info.title
    row: 0
    col: 20
    width: 4
    height: 2
  - title: Genre 1
    name: Genre 1
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.genre1]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Title: video_info.title
    row: 0
    col: 3
    width: 2
    height: 2
  - title: Genre ２
    name: Genre ２
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.genre2]
    sorts: [video_info.genre2]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Title: video_info.title
    row: 0
    col: 5
    width: 3
    height: 2
  - title: Genre ３
    name: Genre ３
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.genre3]
    sorts: [video_info.genre3]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Title: video_info.title
    row: 2
    col: 3
    width: 3
    height: 2
  - title: Demographics
    name: Demographics
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: Sankey
    fields: [demographics_dt.age_group, demographics_dt.gender, demographics_dt.count,
      demographics_dt.subscribed_status]
    sorts: [demographics_dt.count desc]
    limit: 500
    color_range: ["#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3", "#36c1b3",
      "#b57052", "#ed69af"]
    label_type: name_value
    show_null_points: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_basic_a2_daily_first.views,
            id: channel_basic_a2_daily_first.views, name: Views}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: channel_basic_a2_daily_first.avg_watch_time,
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
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Title: video_info.title
    row: 8
    col: 0
    width: 8
    height: 6
  - title: Series First-7 Delta
    name: Series First-7 Delta
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_line
    fields: [video_days.days_after_post, channel_basic_a2_daily_first.views, video_info.video_name]
    pivots: [video_info.video_name]
    filters:
      video_days.days_after_post: NOT NULL
      channel_basic_a2_daily_first.views: NOT NULL
    sorts: [video_info.video_name 0, video_days.days_after_post]
    limit: 500
    dynamic_fields: [{table_calculation: delta, label: Delta, expression: "if(\n \
          \ is_null(${channel_basic_a2_daily_first.views}),\n  null,${runboys}-${meanboys}\n\
          )", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: runboys, label: Runboys, expression: 'running_total(${channel_basic_a2_daily_first.views})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: meanboys, label: Meanboys, expression: "mean(\n\
          \    pivot_row(\n      running_total(${channel_basic_a2_daily_first.views})\n\
          \      )\n    )", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: delta, id: "【海外の反応\
              \ アニメ】 鬼滅の刃 19話 Blade of demon destruction ep 19 アニメリアクション - rsomyyJjfeQ\
              \ - delta", name: "【海外の反応 アニメ】 鬼滅の刃 19話 Blade of demon destruction ep\
              \ 19 アニメリアクション"}, {axisId: delta, id: "【海外の反応 アニメ】 鬼滅の刃 20話 Blade of\
              \ demon destruction ep 20 アニメリアクション - jU78_LDoBxI - delta", name: "【海\
              外の反応 アニメ】 鬼滅の刃 20話 Blade of demon destruction ep 20 アニメリアクション"}, {axisId: delta,
            id: "【海外の反応 アニメ】 鬼滅の刃 21話 Blade of demon destruction ep 21 アニメリアクション -\
              \ p_yGL2HUoWA - delta", name: "【海外の反応 アニメ】 鬼滅の刃 21話 Blade of demon destruction\
              \ ep 21 アニメリアクション"}, {axisId: delta, id: "【海外の反応 アニメ】 鬼滅の刃 22話 Blade\
              \ of demon destruction ep 22 アニメリアクション - txRF85rwQ1s - delta", name: "【海\
              外の反応 アニメ】 鬼滅の刃 22話 Blade of demon destruction ep 22 アニメリアクション"}, {axisId: delta,
            id: "【海外の反応 アニメ】 鬼滅の刃 23話 Blade of demon destruction ep 23 アニメリアクション -\
              \ 2xEmz1OSjZU - delta", name: "【海外の反応 アニメ】 鬼滅の刃 23話 Blade of demon destruction\
              \ ep 23 アニメリアクション"}, {axisId: delta, id: "【海外の反応 アニメ】 鬼滅の刃 24話 Blade\
              \ of demon destruction ep 24 アニメリアクション - fZPGie-bBJc - delta", name: "【海\
              外の反応 アニメ】 鬼滅の刃 24話 Blade of demon destruction ep 24 アニメリアクション"}, {axisId: delta,
            id: "【海外の反応 アニメ】 鬼滅の刃 25話 Blade of demon destruction ep 25 アニメリアクション -\
              \ frwP3u6WYSI - delta", name: "【海外の反応 アニメ】 鬼滅の刃 25話 Blade of demon destruction\
              \ ep 25 アニメリアクション"}, {axisId: delta, id: "【海外の反応 アニメ】 鬼滅の刃 26話 Blade\
              \ of demon destruction ep 26 アニメリアクション - BKwY5EyXg0w - delta", name: "【海\
              外の反応 アニメ】 鬼滅の刃 26話 Blade of demon destruction ep 26 アニメリアクション"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
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
    hide_legend: true
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: true
    show_null_points: false
    interpolation: monotone
    hidden_fields: [channel_basic_a2_daily_first.views, runboys, meanboys]
    listen:
      Title: video_info.title
    row: 14
    col: 0
    width: 8
    height: 6
  - title: Genre 4
    name: Genre 4
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.genre4]
    sorts: [video_info.genre4]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Title: video_info.title
    row: 2
    col: 6
    width: 2
    height: 2
  - title: Title_card (copy)
    name: Title_card (copy)
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: single_value
    fields: [video_info.title_pic]
    filters:
      video_info.title_pic: "-NULL"
    sorts: [video_info.title_pic]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Title: video_info.title
    row: 4
    col: 0
    width: 8
    height: 4
  - title: Metric Fun
    name: Metric Fun
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    type: looker_line
    fields: [channel_basic_a2_daily_first.metric_chooser, channel_basic_a2_daily_first._data_date,
      video_info.video_name]
    pivots: [video_info.video_name]
    filters:
      video_info.video_name: ''
      channel_basic_a2_daily_first.metric_chooser: NOT NULL
    sorts: [channel_basic_a2_daily_first._data_date desc, video_info.video_name]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Title: video_info.title
      Parameter: channel_basic_a2_daily_first.dynamic_measure
    row: 14
    col: 8
    width: 16
    height: 6
  - title: Sharing Breakdown
    name: Sharing Breakdown
    model: thesis_cool
    explore: sharing
    type: looker_line
    fields: [channel_basic_a2_daily_first._data_date, sharing.sharingservice, sharing.count]
    pivots: [sharing.sharingservice]
    fill_fields: [channel_basic_a2_daily_first._data_date]
    sorts: [sharing.sharingservice, channel_basic_a2_daily_first._data_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen:
      Title: video_info.title
    row: 20
    col: 0
    width: 8
    height: 6
  filters:
  - name: Title
    title: Title
    type: field_filter
    default_value: ヴィンランド・サガ
    allow_multiple_values: true
    required: false
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: []
    field: video_info.title
  - name: Parameter
    title: Parameter
    type: field_filter
    default_value: views
    allow_multiple_values: true
    required: false
    model: thesis_cool
    explore: channel_basic_a2_daily_first
    listens_to_filters: []
    field: channel_basic_a2_daily_first.dynamic_measure

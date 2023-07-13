# fc_table_common, app_log_table_common, raw_table_commonなどのdate, user_id形式のviewに対応
explore: fc_base {
  extension: required
  join: platform_selector {
    view_label: "JP/TW切替"
  }
}

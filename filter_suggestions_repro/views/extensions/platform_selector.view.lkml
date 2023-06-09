view: platform_selector {
  parameter: param_platform {
    label: "JP/TW切替"
    description: "jp/twのスキーマ切替"
    type: unquoted
    default_value: "@{bq_jp_dataset_name}"
    allowed_value: {
      label: "JP"
      value: "@{bq_jp_dataset_name}"
    }
    allowed_value: {
      label: "TW"
      value: "@{bq_tw_dataset_name}"
    }
  }
}

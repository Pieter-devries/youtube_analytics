view: sql_table_param {
sql_table_name: `boardgames.{% parameter platform_selector.param_platform %}` ;;
dimension: name {}
}


view: platform_selector {
parameter: param_platform {
label: "JP/TW切替"
description: "jp/twのスキーマ切替"
type: unquoted
default_value: "ranking_2020"
allowed_value: {
label: "JP"
value: "ranking_2020"
}
allowed_value: {
label: "TW"
value: "ranking_2022"
}
}
}

explore: sql_table_param {
join: platform_selector {}
}

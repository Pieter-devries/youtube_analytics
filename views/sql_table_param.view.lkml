view: sql_table_param {
sql_table_name: `boardgames.{% parameter platform_selector.param_platform %}` ;;
dimension: id {
    primary_key: yes
    hidden: yes
  }
dimension: name {}
dimension: url {}
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

view: games_detailed {
  sql_table_name: `boardgames.games_detailed` ;;
  dimension: id {
    primary_key: yes
    hidden: yes
  }
  dimension: name {
    suggest_persist_for: "1 second"
  }
  dimension: category {
    suggest_persist_for: "1 second"
  }
}

explore: base_table {
  extension: required
join: platform_selector {}
}

explore: sql_table_param {
  extends: [base_table]
  join: games_detailed {
    type: inner
    sql_on: ${games_detailed.id} = ${sql_table_param.id} ;;
    relationship: one_to_one
  }
}

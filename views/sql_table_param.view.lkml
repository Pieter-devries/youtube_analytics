view: sql_table_param {
sql_table_name: `@{gcp_project_name}.{% parameter platform_selector.param_platform %}.ranking_2020` ;;
extends: [dm_table_common]
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
default_value: "boardgames"
allowed_value: {
label: "JP"
value: "boardgames"
}
allowed_value: {
label: "TW"
value: "boardgames_copy"
}
}
}

# マスターデータ系テーブル、dateがないサマリーテーブルで利用する想定
view: dm_table_common {
  extension: required
}

# date, user_idを持っているテーブル用の共通view
# fc_**系のデータマートテーブルで利用する想定
view: fc_table_common {
  extension: required

  filter: date_filter {
    label: "日付フィルター"
    description: "日付のパーティション、集計時にフィルターを指定すること"
    type: date
    datatype: date
    sql: {% condition date_filter %} ${partition_raw} {% endcondition %} ;;
  }

  dimension_group: partition {
    label: "日付"
    type: time
    datatype: date
    timeframes: [raw,date,week,month,year,day_of_month,day_of_week,day_of_year,month_num,fiscal_month_num,fiscal_quarter,fiscal_quarter_of_year,fiscal_year]
    sql: ${TABLE}.date ;;
  }

  dimension: user_id {
    label: "ユーザーID"
    type: number
    sql: ${TABLE}.user_id ;;
  }
}

view: games_detailed {
  sql_table_name: `@{gcp_project_name}.{% parameter platform_selector.param_platform %}.games_detailed` ;;
  extends: [fc_table_common]
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

explore: fc_base {
  extension: required
join: platform_selector {}
}

explore: sql_table_param {
  extends: [fc_base]
  join: games_detailed {
    type: inner
    sql_on: ${games_detailed.id} = ${sql_table_param.id} ;;
    relationship: one_to_one
  }
}

view: dm_gachas {
  sql_table_name: `looker-dcl-data.boardgames.ranking_2020` ;;
# sql_table_name: `@{gcp_project_name}.{% parameter platform_selector.param_platform %}.ranking_2020` ;;
extends: [dm_table_common]
dimension: id {
    primary_key: yes
    hidden: yes
  }
dimension: name {}
dimension: url {}
}

view: fc_purchase_gachas {
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

# マスターデータ系テーブル、dateがないサマリーテーブルで利用する想定
view: dm_table_common {
  extension: required
}

# date, user_idを持っているテーブル用の共通view
# fc_**系のデータマートテーブルで利用する想定
view: fc_table_common {
  extension: required

  # filter: date_filter {
  #   label: "日付フィルター"
  #   description: "日付のパーティション、集計時にフィルターを指定すること"
  #   type: date
  #   datatype: date
  #   sql: {% condition date_filter %} ${partition_raw} {% endcondition %} ;;
  # }

  # dimension_group: partition {
  #   label: "日付"
  #   type: time
  #   datatype: date
  #   timeframes: [raw,date,week,month,year,day_of_month,day_of_week,day_of_year,month_num,fiscal_month_num,fiscal_quarter,fiscal_quarter_of_year,fiscal_year]
  #   sql: ${TABLE}.date ;;
  # }

  # dimension: user_id {
  #   label: "ユーザーID"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
}

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

explore: fc_base {
  extension: required
  # conditionally_filter: {
  #   filters: [date_filter: "30 days ago for 30 days"]
  #   unless: [partition_date, partition_month, partition_year]
  # }
join: platform_selector {}
}

explore: dm_gachas {
  extends: [fc_base]
  join: fc_purchase_gachas {
    type: inner
    sql_on: ${fc_purchase_gachas.id} = ${dm_gachas.id} ;;
    relationship: one_to_one
  }
}

explore: pieter_test {
  view_name: fc_purchase_gachas
  extends: [fc_base]

  join: dm_gachas {
    type: inner
    sql_on: ${fc_purchase_gachas.id} = ${dm_gachas.id} ;;
    relationship: one_to_one
  }
}

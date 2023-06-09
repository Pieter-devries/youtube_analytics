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

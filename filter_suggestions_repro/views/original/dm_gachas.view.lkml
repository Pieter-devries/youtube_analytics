include: "/filter_suggestions_repro/views/base/dm_table_common.view.lkml"
view: dm_gachas {
  sql_table_name: `@{gcp_project_name}.{% parameter platform_selector.param_platform %}.ranking_2020` ;;
  extends: [dm_table_common]
  dimension: id {
    primary_key: yes
    hidden: yes
  }
  dimension: name {}
  dimension: url {}
}

include: "/filter_suggestions_repro/views/base/fc_table_common.view.lkml"
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

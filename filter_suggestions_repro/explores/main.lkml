include: "/filter_suggestions_repro/explores/base.lkml"
include: "/filter_suggestions_repro/views/derived/*.view"
include: "/filter_suggestions_repro/views/extensions/*.view"
include: "/filter_suggestions_repro/views/original/*.view"

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

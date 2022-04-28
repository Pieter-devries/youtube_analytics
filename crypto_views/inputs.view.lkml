view: inputs {
#Repeated
  sql_table_name: `bigquery-public-data.crypto_bitcoin.transactions.inputs` ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.index ;;
  }

  dimension: index {type:number description: "0-indexed number of an input within a transaction"}
  dimension: spent_transaction_hash {description: "The hash of the transaction which contains the output that this input spends"}
  dimension: spent_output_index {type:number description:"The index of the output this input spends"}
  dimension: script_asm {description:"Symbolic representation of the bitcoin's script language op-codes"}
  dimension: script_hex {description:"Hexadecimal representation of the bitcoin's script language op-codes"}
  dimension: sequence {description:"A number intended to allow unconfirmed time-locked transactions to be updated before being finalized; not currently used except to disable locktime in a transaction"}
  dimension: required_signatures {description:"The number of signatures required to authorize the spent output"}
  dimension: type {description:"The address type of the spent output"}
  dimension: addresses {description:"Addresses which own the spent output"}
  dimension: value {description:"The value in base currency attached to the spent output"}

  ##Measure
  measure: total_value {
    type: sum
    sql: ${value} ;;
  }

  measure: count {
    type: count
  }












}

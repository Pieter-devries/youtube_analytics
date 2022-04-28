view: transactions {
  derived_table: {
    sql:
      SELECT *
      FROM `bigquery-public-data.crypto_bitcoin.transactions`
      WHERE {% condition date_filter%} block_timestamp {% endcondition %};;
  }

  filter: date_filter {
    type: date_time
    default_value: "today"
  }

## Base Dimensions
  dimension: hash {
    primary_key: yes
    sql: ${TABLE}.hash ;;
    description: "The hash of this transaction"
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
    description: "The size of this transaction in bytes"
  }

  dimension: virtual_size {
    type: number
    sql: ${TABLE}.virtual_size ;;
    description: "The virtual transaction size (differs from size for witness transactions)"
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
    description: "Protocol version specified in block which contained this transaction"
  }

  # dimension_group: lock {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     year
  #   ]
  #   sql: ${TABLE}.lock_time ;;
  #   description: "Earliest time that miners can include the transaction in their hashing of the Merkle root to attach it in the latest block of the blockchain"
  # }

  dimension: lock_time {
    type: number
    sql: ${TABLE}.lock_time ;;
    description: "Earliest time that miners can include the transaction in their hashing of the Merkle root to attach it in the latest block of the blockchain"
  }

  dimension: block_hash {
    type: string
    sql: ${TABLE}.block_hash ;;
    description: "Hash of the block which contains this transaction"
  }

  dimension: block_number {
    type: number
    sql: ${TABLE}.block_number ;;
    description: "Number of the block which contains this transaction"
  }

  dimension_group: block_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year
    ]
    sql: ${TABLE}.block_timestamp ;;
    description: "Timestamp of the block which contains this transaction"
  }

  dimension: input_count {
    type: number
    sql: ${TABLE}.input_count ;;
    description: "The number of inputs in the transaction"
  }

  dimension: output_count {
    type: number
    sql: ${TABLE}.output_count ;;
    description: "The number of outputs in the transaction"
  }

  dimension: input_value {
    type: number
    sql: ${TABLE}.input_value ;;
    description: "Total value of inputs in the transaction"
  }

  dimension: output_value {
    type: number
    sql: ${TABLE}.output_value ;;
    description: "Total value of outputs in the transaction"
  }

  dimension: is_coinbase {
    type: yesno
    sql: ${TABLE}.is_coinbase ;;
    description: "true if this transaction is a coinbase transaction"
  }

  dimension: fee {
    type: number
    sql: ${TABLE}.fee ;;
    description: "The fee paid by this transaction"
  }

  dimension: inputs {
    hidden: yes
    sql: ${TABLE}.inputs ;;
  }

  ## Measures

  measure: total_input_value {
    type: sum
    sql: ${input_value} ;;
    description: "Total value of inputs in the transaction"
  }

  measure: total_output_value {
    type: sum
    sql: ${output_value} ;;
    description: "Total value of outputs in the transaction"
  }
  measure: total_fee {
    type: sum
    sql: ${fee} ;;
    description: "The fee paid by this transaction"
  }

  measure: count {
    type: count
  }

}

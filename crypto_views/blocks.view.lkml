view: blocks {
  derived_table: {
    sql:
      SELECT *
      FROM `bigquery-public-data.crypto_bitcoin.blocks`
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
    description: "The hash of this block"
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
    description: "The size of this block in bytes"
  }

  dimension: stripped_size {
    type: number
    sql: ${TABLE}.stripped_size ;;
    description: "The size of block data (excluding witness data)"
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
    description: "Three times the base size plus the total size. https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki"
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
    description: "The number of the block"
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
    description: "Protocol version specified in block header"
  }

  dimension: merkle_root {
    type: string
    sql: ${TABLE}.merkle_root ;;
    description: "The root node of a Merkle tree, where leaves are transaction hashes"
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year
    ]
    sql: ${TABLE}.timestamp ;;
    description: "Block creation timestamp specified in block header"
  }

  dimension: nonce {
    type: string
    sql: ${TABLE}.nonce ;;
    description: "Difficulty solution specified in block header"
  }

  dimension: bits {
    type: string
    sql: ${TABLE}.bits ;;
    description: "Difficulty threshold specified in block header"
  }

  dimension: coinbase_param {
    type: string
    sql: ${TABLE}.coinbase_param ;;
    description: "Data specified in the coinbase transaction of this block"
  }

  measure: count {
    type: count
  }

}

view: vietnam_map {
  derived_table: {
    sql:  SELECT 'Spratly Islands' as location, 1 as number
  UNION ALL SELECT 'Vietnam' as location, 1 as number
  ;;
  }

  dimension: location {
    map_layer_name: vietnam_islands
    sql: ${TABLE}.location ;;
  }
  dimension: location2 {
    map_layer_name: countrie
    sql: ${TABLE}.location ;;
  }
  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }
}

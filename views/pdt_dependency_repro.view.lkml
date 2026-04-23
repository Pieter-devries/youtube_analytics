explore: daily_calendar {
  aggregate_table: atc_detailed_summary {
    materialization: {
      persist_for: "24 hours"
    }
    query: {
      dimensions: [number, product]
      measures: [count] # Assumes you have a count measure defined
    }
  }
}

view: daily_calendar {
  derived_table: {
    sql:
      WITH data AS (
        SELECT '1127.920000' as number, '風邪薬(1)' as product
        UNION ALL SELECT '1039.920000' as number, '衛生管理(2)' as product
        UNION ALL SELECT '366300.000000' as number, '日用品(12)' as product
        UNION ALL SELECT '7774.000000' as number, '冷凍食品(31)' as product
        UNION ALL SELECT '1.55000000' as number, 'ベビー(4)' as product
        UNION ALL SELECT '1.25' as number, 'ペット用品(5)' as product
        UNION ALL SELECT '1.0' as number, 'プロティン(8)' as product
        UNION ALL SELECT '1.05' as number, 'チョコレート(56)' as product
        UNION ALL SELECT '11.05' as number, 'ソフトドリンク(102)' as product
        UNION ALL SELECT '20.50' as number, 'サプリメント(9)' as product
        UNION ALL SELECT '99999999999999900.123' as number, 'xxx' as product
      )
      SELECT
        d.number,
        d.product,
        CURRENT_TIMESTAMP() as built_at
      FROM data d
      CROSS JOIN UNNEST(GENERATE_ARRAY(1, 10000)) a1
      CROSS JOIN UNNEST(GENERATE_ARRAY(1, 10000)) a2
    ;;
    persist_for: "24 hours"
  }

  dimension: number { type: string }
  dimension: product { type: string }
  dimension: built_at { type: string }
  measure: count {type: count}
}

view: atc_detailed_summary {
  # This is the dependent child table
  derived_table: {
    explore_source: daily_calendar {
      column: number { field: daily_calendar.number }
      column: product { field: daily_calendar.product }
      column: count { field: count}
    }
    persist_for: "24 hours"
  }

  dimension: number { type: string }
  dimension: product { type: string }
  measure: count {}
}

explore: sql_runner_query  {}
view: sql_runner_query {
  derived_table: {
    sql: WITH created_dt AS (SELECT '1127.920000' as number, '風邪薬(1)' as product
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
          created_dt.number  AS created_dt_num
      FROM created_dt
      GROUP BY
          1
      ORDER BY
          1
      LIMIT 500 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: created_dt_num {
    type: string
    sql: ${TABLE}.created_dt_num ;;
  }

  set: detail {
    fields: [
        created_dt_num
    ]
  }
}

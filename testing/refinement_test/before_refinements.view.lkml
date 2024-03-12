view: before_refinements {
    derived_table: {
      sql: SELECT '1127.920000' as number, '風邪薬(1)' as product
          UNION ALL SELECT '1039.920000' as number, '衛生管理(2)' as product
          UNION ALL SELECT '366300.000000' as number, '日用品(12)' as product
          UNION ALL SELECT '7774.000000' as number, '冷凍食品(31)' as product
          UNION ALL SELECT '1.55000000' as number, 'ベビー(4)' as product
          UNION ALL SELECT '1.25' as number, 'ペット用品(5)' as product
          UNION ALL SELECT '1.0' as number, 'プロティン(8)' as product
          UNION ALL SELECT '1.05' as number, 'チョコレート(56)' as product
          UNION ALL SELECT '11.05' as number, 'ソフトドリンク(102)' as product
          UNION ALL SELECT '20.50' as number, 'サプリメント(9)' as product
          ;;
    }

    dimension: case_test {
      sql:
          CASE WHEN ${product} = '風邪薬' THEN 1
          ELSE 2 END;;
    }

    dimension: num {
      type: number
      sql: ${TABLE}.number ;;
    }

    dimension: product {}
}

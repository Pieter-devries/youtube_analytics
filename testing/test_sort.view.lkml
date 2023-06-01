explore: test_sort {}
view: test_sort {
  derived_table: {
    sql: SELECT '20代' as age
        UNION ALL SELECT '20歳未満' as age
        UNION ALL SELECT '30代' as age
        UNION ALL SELECT '40代' as age
        UNION ALL SELECT '50代' as age
        UNION ALL SELECT '60歳以上'
        ;;
  }
  dimension: age {
  }
}

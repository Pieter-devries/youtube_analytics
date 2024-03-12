view: sub_total_master {
  derived_table: {

    sql:

      SELECT "role1" AS nm1, "full time" AS nm2, "A" AS nm3, 1 AS num, 1 AS sort_num, 1 AS nm3_dp

            UNION ALL

      SELECT "role1" AS nm1, "full time" AS nm2, "B" AS nm3, 1 AS num, 2 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "full time" AS nm2, "C" AS nm3, 2 AS num, 3 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "full time" AS nm2, "D" AS nm3, 1 AS num, 4 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "full time" AS nm2, "E" AS nm3, 2 AS num, 5 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "full time" AS nm2, "F" AS nm3, 3 AS num, 6 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "contract" AS nm2, "G" AS nm3, 1 AS num, 7 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "contract" AS nm2, "H" AS nm3, 1 AS num, 8 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "contract" AS nm2, "I" AS nm3, 2 AS num, 9 AS sort_num, 1 AS nm3_dp

      UNION ALL

      SELECT "role1" AS nm1, "contract" AS nm2, "J" AS nm3, 2 AS num, 10 AS sort_num, 1 AS nm3_dp
      ;;

  }

  dimension: pk {
    primary_key: yes
    sql: ${sort_num} ;;
  }

  dimension: nm1 {
    type: string
    sql: ${TABLE}.nm1 ;;
  }
  dimension: nm2 {
    type: string
    sql: ${TABLE}.nm2 ;;
  }
  dimension: nm3 {
    type: string
    # sql: ${TABLE}.nm3 ;;
    sql:
      CASE ${nm3_dp}
        WHEN 1 THEN ${TABLE}.nm3
        WHEN 0 THEN ${nm2}
      END
    ;;
    # order_by_field: sort_num
    }
    dimension: sort_num {
      hidden: yes
      type: number
      sql: ${TABLE}.sort_num ;;
    }

    dimension: nm3_dp {
      hidden: yes
      type: number
      label: "display"
      sql: ${TABLE}.nm3_dp ;;
    }

    measure: num {
      type: sum
      sql: ${TABLE}.num ;;
    }

  }

view: sub_total_transaction {
  sql_table_name: ${sub_total_master.SQL_TABLE_NAME} ;;

  dimension: pk {
    primary_key: yes
    sql: CONCAT(${nm3_trans},${nm4_trans}) ;;
  }

  dimension: nm3_trans {
    sql: ${TABLE}.nm3 ;;
  }

  dimension: nm4_trans {
    sql: ${TABLE}.sort_num ;;
  }

}

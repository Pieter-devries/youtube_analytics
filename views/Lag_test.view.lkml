view: LAG_TEST {
  derived_table: {
    sql:
          SELECT *, LAG(published_date) OVER
          (PARTITION by genre_1 ORDER BY published_date ASC) as previous

          FROM video_info ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }
  dimension: published_date {
    type: date
    sql: ${TABLE}.published_date ;;
  }
  dimension: previous {
    type: date
    sql: ${TABLE}.previous ;;
  }
  dimension: genre {
    type: string
    sql: ${TABLE}.genre_1 ;;
  }
  dimension: datediff {
    type: number
    sql: DATE_DIFF(${published_date},${previous},day) ;;
  }
  }

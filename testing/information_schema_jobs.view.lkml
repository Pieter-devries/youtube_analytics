explore: information_schema_jobs {}
view: information_schema_jobs {
  sql_table_name: `region-asia-northeast1`.INFORMATION_SCHEMA.JOBS_BY_PROJECT ;;

  dimension_group: created {
    type: time
    sql: ${TABLE}.creation_time ;;
    timeframes: [raw,date,week,month,year]
  }
  dimension: project_id {
    sql: ${TABLE}.project_id ;;
  }
  dimension: project_number {
    sql: ${TABLE}.project_number ;;
  }
  dimension: user_email {
    sql: ${TABLE}.user_email ;;
  }
  dimension: job_id {
    sql: ${TABLE}.job_id ;;
  }
  }

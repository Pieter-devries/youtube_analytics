connection: "youtube_database"

include: "*.view.lkml"


datagroup: eight_hours_trigger_datagroup{
sql_trigger: SELECT ‎CURRENT_TIME() ;;

}

explore: cascade_c {}

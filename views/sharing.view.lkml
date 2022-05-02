view: sharing {
  derived_table: {
    sql_trigger_value: select current_date() ;;
    sql: SELECT *,CASE
WHEN sharing_service = 0  THEN "Unknown"
WHEN sharing_service = 1  THEN "igg"
WHEN sharing_service = 4  THEN "Reddit"
WHEN sharing_service = 5  THEN "tumbleUpon"
WHEN sharing_service = 6  THEN "Mixi"
WHEN sharing_service = 7  THEN "Yahoo! Japan"
WHEN sharing_service = 8  THEN "goo"
WHEN sharing_service = 9  THEN "Ameba"
WHEN sharing_service = 10 THEN "Facebook"
WHEN sharing_service = 11 THEN "Myspace"
WHEN sharing_service = 12 THEN "NUjij"
WHEN sharing_service = 18 THEN "Tuenti"
WHEN sharing_service = 20 THEN "menéame"
WHEN sharing_service = 21 THEN "Wykop"
WHEN sharing_service = 22 THEN "Skyrock"
WHEN sharing_service = 25 THEN "Fotka"
WHEN sharing_service = 28 THEN "hi5"
WHEN sharing_service = 31 THEN "Twitter"
WHEN sharing_service = 32 THEN "Cyworld"
WHEN sharing_service = 34 THEN "Blogger"
WHEN sharing_service = 36 THEN "VKontakte (ВКонтакте)"
WHEN sharing_service = 37 THEN "Rakuten (楽天市場)"
WHEN sharing_service = 38 THEN "LiveJournal"
WHEN sharing_service = 39 THEN "Odnoklassniki (Одноклассники)"
WHEN sharing_service = 40 THEN "tumblr."
WHEN sharing_service = 42 THEN "Linkedin"
WHEN sharing_service = 43 THEN "Google+"
WHEN sharing_service = 44 THEN "Weibo"
WHEN sharing_service = 45 THEN "Pinterest"
WHEN sharing_service = 46 THEN "Email"
WHEN sharing_service = 47 THEN "Facebook Messenger"
WHEN sharing_service = 49 THEN "WhatsApp"
WHEN sharing_service = 50 THEN "Hangouts"
WHEN sharing_service = 51 THEN "Gmail"
WHEN sharing_service = 52 THEN "Kakao (Kakao Talk)"
WHEN sharing_service = 53 THEN "Other"
WHEN sharing_service = 55 THEN "Copy to Clipboard"
WHEN sharing_service = 59 THEN "Embed"
WHEN sharing_service = 60 THEN "Text message"
WHEN sharing_service = 61 THEN "Android messaging"
WHEN sharing_service = 62 THEN "Verizon messages"
WHEN sharing_service = 63 THEN "HTC text message"
WHEN sharing_service = 64 THEN "Sony Conversations"
WHEN sharing_service = 65 THEN "Go SMS"
WHEN sharing_service = 66 THEN "LGE Email"
WHEN sharing_service = 67 THEN "Line"
WHEN sharing_service = 68 THEN "Viber"
WHEN sharing_service = 69 THEN "Kik"
WHEN sharing_service = 70 THEN "Skype"
WHEN sharing_service = 71 THEN "Blackberry Messenger"
WHEN sharing_service = 72 THEN "WeChat"
WHEN sharing_service = 73 THEN "KAKAO Story"
WHEN sharing_service = 74 THEN "Dropbox"
WHEN sharing_service = 75 THEN "Telegram"
WHEN sharing_service = 76 THEN "Facebook Pages"
WHEN sharing_service = 77 THEN "GroupMe"
WHEN sharing_service = 78 THEN "Android Email"
WHEN sharing_service = 79 THEN "Motorola Messaging"
WHEN sharing_service = 80 THEN "Nearby Share"
WHEN sharing_service = 81 THEN "Naver"
WHEN sharing_service = 82 THEN "iOS System Activity Dialog"
WHEN sharing_service = 83 THEN "Google Inbox"
WHEN sharing_service = 84 THEN "Android Messenger"
WHEN sharing_service = 85 THEN "YouTube Music"
WHEN sharing_service = 86 THEN "YouTube Gaming"
WHEN sharing_service = 87 THEN "YouTube Kids"
WHEN sharing_service = 88 THEN "YouTube TV"
ELSE NULL END as sharingservice,
GENERATE_UUID() as primary_key
FROM channel_sharing_service_a1_daily_first LIMIT 1000 ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.primary_key;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_week,
      day_of_week_index,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: shares {
    type: number
    sql: ${TABLE}.shares ;;
  }

  dimension: sharing_service {
    hidden: yes
    type: number
    sql: ${TABLE}.sharing_service ;;
  }

  dimension: sharingservice {
    type: string
    sql: ${TABLE}.sharingservice ;;
    drill_fields: [scrape_data.title,scrape_data.video_name,Basic.vid_stats*]
  }

  dimension: subscribed_status {
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  measure: count {
    type: count
    drill_fields: [scrape_data.title,scrape_data.video_name,Basic.vid_stats*]
  }
}

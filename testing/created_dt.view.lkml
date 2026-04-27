explore: test_ref_dt {}

view: test_ref_dt {
  derived_table: {
    sql:
    SELECT case_test
    FROM `${created_dt.SQL_TABLE_NAME}`;;
  }
dimension: case_test {}
}

view: created_dt {
derived_table: {
  sql: SELECT '1127.920000' as number, 1127.920000 as int,'風邪薬(1)' as product
  UNION ALL SELECT '1039.920000' as number, 1039.920000 as int,'衛生管理(2)' as product
  UNION ALL SELECT '366300.000000' as number, 366300.000000 as int,'日用品(12)' as product
  UNION ALL SELECT '7774.000000' as number, 7774.000000 as int,'冷凍食品(31)' as product
  UNION ALL SELECT '1.55000000' as number, 1.55000000 as int, 'ベビー(4)' as product
  UNION ALL SELECT '1.25' as number, 1.25 as int, 'ペット用品(5)' as product
  UNION ALL SELECT '1.0' as number, 1.0 as int,'プロティン(8)' as product
  UNION ALL SELECT '1.05' as number, 6435234241236234543254.123 as int,'チョコレート(56)' as product
  UNION ALL SELECT '11.05' as number, 12321 as int,'ソフトドリンク(102)' as product
  UNION ALL SELECT '20.50' as number, 9999999999999990011.123 as int, 'サプリメント(9)' as product
  UNION ALL SELECT '99999999999999900.123' as number, 99999999999999900.123 as int, 'xxx' as product
  ;;
}
  dimension: test_row {
    sql: ${TABLE}.number ;;
    link: {
      label: "マイページ"
      url: "https://roomclip.jp/myroom/{{ value }}"
    }
    link: {
      label: "{% if row['created_dt.product'] %} 風邪薬 {% endif %}"
      url: "kaze"
    }
    link: {
      label: "{% if row['created_dt.product'] %} 日用品 {% endif %}"
      url: "nichi"
    }
    link: {
      label: "{% if row['created_dt.product'] %} ペット用品 {% endif %}"
      url: "pet"
    }
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

dimension: int {
  type: number
  sql: ${TABLE}.int ;;
}
measure: sum {
  type: sum
  sql: ${int} ;;
}
dimension: product {}

dimension: prod_num {
  type: number
  sql: REGEXP_EXTRACT(${product}, r'([.+])') ;;
}

dimension: num_string {
  type: string
  sql: ${num} ;;
  order_by_field: num
}

dimension: num_html {
  type: number
  sql: ${num} ;;
  html: {{value}}  ;;
}

dimension: remove_html {
  type: number
  sql: ${num} ;;
  # Goal is to return a whole number with decimals,  including one extra 0 then normal.
  # Split whole numbers and decimal numbers.
  # Keep whole numbers separate, and don't change them.
  # Reverse order of decimal numbers, if two 00s are in a row, stop on the first 0.
  # Get the index of the first 0, and subtract it from the size of the decimal array.
  # Return the subtracted non-reversed array.
  html:
  {% assign numbers = value | split: '.' %}
  {% assign whole = numbers | first %}
  {% assign dec = numbers | last %}
  {% assign dec_size = numbers.last | size %}
  {% assign dec_rev = numbers.last | split: '' | reverse | join: '' %}
  {% assign rev_num = dec_rev | split: '' %}
  {% assign prev_num = 1 %}
  <ul>
  {% if dec_size == 0 or dec_size == 1%}
    {{value}}
  {% else %}
    {% for i in (1..dec_size) %}
      {% unless forloop.last %}
      <li>{{i}}</li>
      {% endunless %}
    {% endfor %}
  {% endif %}
  {{numbers.first}}, {{numbers.last}}, {{numbers.last | size}}, {{dec_rev}}
  </ul>
  ;;
}
}

  # {% for each in rev_num %}
  # {% assign current_number = each %}
  # <li> {{prev_num}}, {{current_number}}, {{forloop.index}}</li>
  # {% if prev_num == 0 %}
  #   {% break %}
  # {% endif %}
  #   {% assign prev_num = current_number %}
  # {% endfor %}
# {{whole}},{{last}},{{last | size}}
# <ul>
#   {% for num in numbers %}
#   <li> {{num}} {{ num | size }} </li>
#   {% endfor%}

view: created_dt {
derived_table: {
  sql: SELECT '1127.920000' as number, '風邪薬' as product
  UNION ALL SELECT '1039.920000' as number, '衛生管理' as product
  UNION ALL SELECT '366300.000000' as number, '日用品' as product
  UNION ALL SELECT '7774.000000' as number, '冷凍食品' as product
  UNION ALL SELECT '1.55000000' as number, 'ベビー' as product
  UNION ALL SELECT '1.25' as number, 'ペット用品' as product
  UNION ALL SELECT '1.0' as number, 'プロティン' as product
  UNION ALL SELECT '1.05' as number, 'チョコレート' as product
  UNION ALL SELECT '11.05' as number, 'ソフトドリンク' as product
  UNION ALL SELECT '20.50' as number, 'サプリメント' as product
  ;;
}

dimension: num {
  type: number
  sql: ${TABLE}.number ;;
}

dimension: product {}

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

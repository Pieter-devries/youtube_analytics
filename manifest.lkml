project_name: "pieter"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

new_lookml_runtime: no

remote_dependency: test {
  url: "https://github.com/pietermdevries/test-instance"
  ref: "master"
}

constant: suggestion {
  value: "suggestions: yes"
}

constant: connection {
  value: "youtube_database"
}
constant: gcp_project_name {
  value: "looker-dcl-data"
}
constant: bq_jp_dataset_name {
  value: "boardgames"
}
constant: bq_tw_dataset_name {
  value: "boardgames_copy"
}

constant: field_name {
  value: "
  {% if _user_attributes['role'] == 'admin' %}
  country_code
  {% elsif _user_attributes['role'] == 'user' %}
  date_year
  {% endif %}
  "
}

constant: user_attribute {
  value: "
  {% if _user_attributes['role'] == 'admin' %}
  country
  {% elsif _user_attributes['role'] == 'user' %}
  year
  {% endif %}"
}

constant: negative_format {
  value: "{% if value < 0 %}<p style='color:red;'>({{rendered_value}})</p>{% else %} {{rendered_value}} {% endif %}"
}

constant: timesframes {
  value: "        raw,
        time,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        month_num,
        fiscal_month_num,
        fiscal_year"
}

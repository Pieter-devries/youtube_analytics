project_name: "pieter"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

remote_dependency: test {
  url: "https://github.com/pietermdevries/test-instance"
  ref: "master"
}

constant: connection {
  value: "youtube_database"
}

roles = [
  "contributor",
  "editor",
  "admin"
]

roles.each do |role|
  Role.find_or_create_by_name(role)
end
roles = [
  "contributor",
  "moderator",
  "editor",
  "admin"
]

roles.each do |role|
  if User.find_by_name(role).blank?
    user = User.create(name: role, email: "#{role}@kabupaten.org", password: 'password', password_confirmation: 'password')
    user.update_attribute(:confirmed_at, Time.now)
    user.add_role role
  end
end
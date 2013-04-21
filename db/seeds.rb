unless Rails.env.production?
  User.find_or_create_by_email "admin@example.com" do |user|
    user.password = "sellingstuff"
    user.password_confirmation = "sellingstuff"
  end
end

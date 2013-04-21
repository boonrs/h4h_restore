if Rails.env.production? || Rails.env.staging?
  H4hRestore::Application.config.secret_token = ENV["SECRET_TOKEN"]
else
  H4hRestore::Application.config.secret_token = '4b85c30168ef819c80696362b7432d4ed4c8a49c9e914b016ef2431b3bf9e2d7c0e98b906eb73a7758edfaa8206bf7c84a9911c53e4d44041b98f6305a48b121'
end

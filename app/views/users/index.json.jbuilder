json.array!(@users) do |user|
  json.extract! user, :id, :login, :imgPath, :getMail, :isAdmin, :email
  json.url user_url(user, format: :json)
end

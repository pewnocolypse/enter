json.array!(@pictures) do |picture|
  json.extract! picture, :id, :Subject, :Comment, :Date, :image_url, :add_follower_count_to_pictures, :create_users
  json.url picture_url(picture, format: :json)
end

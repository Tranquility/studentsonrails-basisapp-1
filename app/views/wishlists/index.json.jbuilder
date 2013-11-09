json.array!(@wishlists) do |wishlist|
  json.extract! wishlist, :title, :user_id, :description
  json.url wishlist_url(wishlist, format: :json)
end

json.extract! card, :id, :title, :description, :display_from, :display_finish, :created_at, :updated_at
json.url card_url(card, format: :json)

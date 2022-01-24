json.extract! room, :id, :description, :monster_id, :created_at, :updated_at
json.url room_url(room, format: :json)

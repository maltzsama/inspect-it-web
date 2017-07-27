json.extract! inspection, :id, :name, :created_at, :updated_at, :occurrence_ids
json.url occurrence_url(inspection, format: :json)

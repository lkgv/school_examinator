json.extract! std_activity, :id, :description, :score, :created_at, :updated_at
json.url std_activity_url(std_activity, format: :json)

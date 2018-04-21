json.extract! candidate, :id, :name, :sex, :phone, :address, :formatted_address, :birth_date, :previous_experience, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)

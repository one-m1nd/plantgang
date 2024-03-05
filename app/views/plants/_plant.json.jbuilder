json.extract! plant, :id, :name, :year_acquired, :created_at, :updated_at

json.genus do
  json.extract! plant.genus, :id, :name, :created_at, :updated_at
end

json.family do
  json.extract! plant.family, :id, :name, :created_at, :updated_at
end

json.status do
  json.extract! plant.status, :id, :name, :created_at, :updated_at
end
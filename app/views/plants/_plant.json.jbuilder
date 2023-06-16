json.extract! plant, :id, :name, :created_at, :updated_at

json.genus do
  json.extract! plant.genus, :id, :name, :created_at, :updated_at
end

json.family do
  json.extract! plant.family, :id, :name, :created_at, :updated_at
end
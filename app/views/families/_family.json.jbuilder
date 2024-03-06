json.extract! family, :id, :name, :created_at, :updated_at

json.genera family.genera do |genus|
  json.id genus.id
  json.name genus.name
  json.created_at genus.created_at
  json.updated_at genus.updated_at
end

json.plants family.plants do |plant|
  json.id plant.id
  json.name plant.name
  json.common_name plant.common_name
  json.year_acquired plant.year_acquired
  json.status plant.status.name
  json.created_at plant.created_at
  json.updated_at plant.updated_at
end
json.array!(@floors) do |floor|
  json.extract! floor, :id, :revit_id, :done, :details, :level_name, :material, :thickness, :floor_type
  json.url floor_url(floor, format: :json)
end

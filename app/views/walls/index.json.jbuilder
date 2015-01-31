json.array!(@walls) do |wall|
  json.extract! wall, :id, :revit_id, :done, :details, :type, :height, :thickness, :material
  json.url wall_url(wall, format: :json)
end

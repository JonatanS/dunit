json.array!(@columns) do |column|
  json.extract! column, :id, :revit_id, :done, :details, :section, :material, :angle
  json.url column_url(column, format: :json)
end

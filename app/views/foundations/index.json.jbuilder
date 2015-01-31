json.array!(@foundations) do |foundation|
  json.extract! foundation, :id, :revit_id, :done, :details, :material, :foundation_type, :rotation
  json.url foundation_url(foundation, format: :json)
end

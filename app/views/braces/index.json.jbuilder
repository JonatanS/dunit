json.array!(@braces) do |brace|
  json.extract! brace, :id, :revit_id, :done, :details, :section, :material, :angle
  json.url brace_url(brace, format: :json)
end

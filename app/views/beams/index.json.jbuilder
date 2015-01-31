json.array!(@beams) do |beam|
  json.extract! beam, :id, :revit_id, :done, :details, :section, :material, :angle
  json.url beam_url(beam, format: :json)
end

json.array!(@rooms) do |room|
  json.extract! room, :id, :revit_id, :name, :number, :base_finish, :wall_finish, :ceiling_finish, :floor_finish, :occupancy, :area, :level_name, :height
  json.url room_url(room, format: :json)
end

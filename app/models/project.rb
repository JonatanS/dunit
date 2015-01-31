class Project < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships

  def self.sample_json
  	'{"Project_ID": "abc123", "building_elements": [["wall", {"thickness": "12","height":"130.5","wall_type":"structural","material":"concrete_xyz","revit_id":"2342j33429212as"}],["beam", {"section":"W14x90","material":"steel","angle":"0","revit_id":"334g3245s994885"}]]}'
  end

  def parse_json_payload
  	project_data = JSON.parse payload

  	project_data["building_elements"].each do |element_data|
  	  element_class = element_data.first
  	  element = element_class.capitalize.constantize.new element_data.last
  	  element.project = self
  	  Rails.logger.info "ingested component data: #{element.inspect}"
  	end
  end

end

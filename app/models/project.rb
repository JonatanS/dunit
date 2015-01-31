class Project < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :rooms
  has_many :walls
  has_many :beams
  has_many :columns
  has_many :braces
  has_many :foundations
  has_many :floors

  def self.sample_json
  	'{"wall", {"thickness": "12","height":"130.5","wall_type":"structural","material":"concrete_xyz","revit_id":"2342j33429212as"},"beam", {"section":"W14x90","material":"steel","angle":"0","revit_id":"334g3245s994885"}}'
  end

  def parse_json_payload
  	project_data = JSON.parse payload

  	project_data.each do |element_type, element_data|
  	  begin
    	  element = element_type.capitalize.constantize.new element_data
    	  element.project = self
        element.details = element_data.to_s
    	  Rails.logger.info "ingested component data: #{element.inspect}"
        element.save
      rescue NameError => e
        Rails.logger.debug "an unknown component name was reached: #{element_data.first}"
      end
  	end
  end

end

class Level1 < ActiveRecord::Base
	has_many :level2s
	belongs_to :level0

	def level1_attributes=(level1_attributes)
		level1_attributes.each do |attributes|
			level1s.build(attributes)
		end
	end
end

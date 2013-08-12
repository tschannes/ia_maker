class Level0 < ActiveRecord::Base
	has_many :level1s
	has_many :level2s, through: :level1s

	def level1_attributes=(level1_attributes)
		level1_attributes.each do |attributes|
			level1s.build(attributes)
		end
	end
end

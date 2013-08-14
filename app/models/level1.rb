class Level1 < ActiveRecord::Base
	has_many :level2s
	belongs_to :level0

	accepts_nested_attributes_for :level2s, :allow_destroy => true

	def level1_attributes=(level1_attributes)
		level1_attributes.each do |attributes|
			level1s.build(attributes)
		end
	end
end

class Level0 < ActiveRecord::Base
	has_many :level1s
	has_many :level2s, through: :level1s

	validates_presence_of :title
end

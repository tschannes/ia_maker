class Level1 < ActiveRecord::Base
	has_many :level2s
	belongs_to :level0
end

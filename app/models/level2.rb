class Level2 < ActiveRecord::Base
	has_one :level1
	belongs_to :level0
	

end

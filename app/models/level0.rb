class Level0 < ActiveRecord::Base
	has_many :level1s
	has_many :level2s, through: :level1s

	validates_presence_of :title

	def as_json(options={})
		{
		:level1s		 => self.level1s,
		:title           => self.title,
		:overview        => self.overview,
		:description     => self.description
		# :url		     => self.url,
		# :status 		 => self.status
		}
	end

end

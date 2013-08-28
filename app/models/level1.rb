class Level1 < ActiveRecord::Base
	has_many :level2s
	belongs_to :level0

	accepts_nested_attributes_for :level2s, :allow_destroy => true

	validates_presence_of :title

		def as_json(options={})
		{
		:level2s		 => self.level2s,
		:title           => self.title,
		:overview        => self.overview,
		:description     => self.description
		# :url		     => self.url,
		# :status 		 => self.status
		}
	end
end

class Level0sController < ApplicationController

	def index
		@level0s = Level0.all
		@level1s = Level1.all
		@level2s = Level2.all
	end
end

class SharedController < ApplicationController
	include common_thing
	def Frontpage
		@message = "hello World"
	end

	

	
end
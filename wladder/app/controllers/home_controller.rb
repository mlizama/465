class HomeController < ApplicationController
	require 'ladder'
	require 'words4'
	def index
		@begin = dictionary.sample
		@end   = dictionary.sample
	end
	
	def show

	@begin = params[:begin]
	@end   = params[:end]	
	end

end

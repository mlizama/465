class HomeController < ApplicationController
	require 'ladder'
	require 'words4'
	def index
		@begin = dictionary.sample
		@end   = dictionary.sample
	end
	
	def show

	@iter = 1

	@myarray = []

	@begin = params[:begin]
	@myarray.push(@begin)

	@one   = params[:one]
	@myarray.push(@one)

	@two   = params[:two]
	@myarray.push(@two)	

	@three = params[:three]
	@myarray.push(@three)

	@four  = params[:four]
        @myarray.push(@four)

	@five  = params[:five]	
        @myarray.push(@five)


        @end   = params[:end]
        @myarray.push(@end)

	@myarray.delete("")

	@win = legal @myarray
	@result = ""
	
	   if @win
	   @result = "Hurray you won!"
	   else
	   @result = "Sorry you lost!"
	   end
	end		

end

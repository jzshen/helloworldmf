class StoriesController < ApplicationController

  def index
	@stories = Stories.all #search(params[:search]).paginate(page: params[:page], per_page: 20)
		respond_to do |format|
			format.html{
				format.html
				format.js
			}
		end
  end

  def show
  	@stories = Stories.find(params[:id])
  end

  def new
  	@stories = Stories.new
  end

  def create
	@stories = Stories.new(stories_params)
	if @stories.valid?
		@stories.save
		redirect_to stories_url
	else
		render 'new'
	end
  end

  def edit
	@stories = Stories.find(params[:id])
  end

  def update
	@stories = Stories.find(params[:id])
	if @stories.update_attributes(stories_params)
		redirect_to stories_url
	else
		render 'show'
	end
  end

private

   def stories_params
	params.require(:stores).permit()
   end	


end

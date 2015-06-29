class TopicsController < ApplicationController

	before_action :set_topic, :only =>[:show,:destroy,:edit,:update]


	def index

		@topics=Topic.all

	end


	def new

		@topic=Topic.new

	end

	def create

		@topic=Topic.new(get_params)
		@topic.save
		redirect_to topics_path
	end

	def show
		
		@comment=Comment.new
		@comments=@topic.comments


	end

	def destroy

	end

	def set_topic

		@topic=Topic.find(params[:id])

	end

	def get_params

		params.require(:topic).permit(:title, :content, :status,:category_ids => [])

	end



end

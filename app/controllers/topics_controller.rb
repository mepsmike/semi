class TopicsController < ApplicationController

	before_action :set_topic, :only =>[:show,:destroy,:edit,:update]


	def index

		@topics=Topic.select("topics.id, topics.title, topics.user_id, count(comments.id) as num,topics.created_at as latesttime").joins("LEFT JOIN comments ON comments.topic_id = topics.id" ).group("topics.id")


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

		params.require(:topic).permit(:title, :content, :category)

	end



end

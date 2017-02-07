class QuestsController < ApplicationController
	def index
		if current_user
			@quests = Quest.all
		else
			redirect_to root_path
		end
	end

	def new
		if !current_user
			redirect_to root_path
		elsif admin
			@quest = Quest.new
		else
			redirect_to root_path
		end
	end

	def show
		if current_user
			@quest = Quest.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def create
		if admin
			@quest = Quest.new(quest_params)
		else
			redirect_to root_path
		end
		if @quest.save
			flash[:success] = "Quête créée !"
			redirect_to @quest
		else
			render 'new'
		end
	end

	def quest_params
		params.require(:quest).permit(:title, :content, :png, :item, :experience)
	end

end
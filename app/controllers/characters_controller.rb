class CharactersController < ApplicationController
	def index
		if current_user
			@Characters = Character.where(:id_user => current_user.id)

		else
			redirect_to root_path
		end
	end

	def new
		if current_user
			@character = Character.new
		else
			redirect_to root_path
		end
	end

	def show
		if current_user
			@character = Character.find(params[:id])
		else
			redirect_to root_path
		end
	end

	def create
		@character = Character.new(character_params)
		@character.vie = 100
		@character.force = 0
		@character.experience = 0
		@character.id_user = current_user.id
		if @character.save
			flash[:success] = "Personnage créé !"
			redirect_to @character
		else
			render 'new'
		end
	end

	def character_params
		params.require(:character).permit(:name)
	end

end

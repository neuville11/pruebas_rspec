class AnimalsController <ApplicationController
	def create
		@animal = Animal.create(animal_params)
		redirect_to animal_path(@animal)
	end

	def show
		@animal=Animal.find(params[:id])	
	end
	def index
		@animals=Animal.all
	end

	def destroy
		@animal=Animal.find(params[:id])
		@animal.destroy
		redirect_to animals_path
	end

	def update
		@animal=Animal.find(params[:id])
		@animal.update(animal_params)
    	redirect_to animals_path
	end

	private	

	def animal_params
		params.require(:animal).permit(:specie)
	end
end
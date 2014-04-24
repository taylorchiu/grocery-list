class FoodsController < ApplicationController
	def index
		@foods = Food.all
	end

	def show
		@food = Food.find(params[:id])
	end

	def new
		@food = Food.new
	end

	def create
		@food = Food.create food_params
		redirect_to food_path(@food)
	end

	def edit
		@food = Food.find(params[:id])
	end

	def update
		@food = Food.find(params[:id])
		@food.update food_params
		redirect_to food_path(@food)
	end

	def destroy
		Food.find(params[:id]).destroy
		redirect_to root_path
	end

	private
		def food_params
			params.require(:food).permit(:item, :description)
		end
end

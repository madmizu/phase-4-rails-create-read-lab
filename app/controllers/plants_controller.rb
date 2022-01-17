class PlantsController < ApplicationController

    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: { error: "Plant not found"}, status: :not_found
        end
    end

    def create
        render json: Plant.create(plant_params), except: [:created_at, :updated_at], status: :created
    end

    private

    def plant_params
        params.permit(:id, :name, :image, :price)
    end
end

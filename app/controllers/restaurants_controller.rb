class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        render json: Restaurant.all.to_json
    end

    def show
        render json: find_restaurant, include: :pizzas
    end

    def destroy
        find_restaurant.destroy
        head :no_content
    end

    private

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found
        render json: { error: "Restaurant not found" }, status: :not_found
    end

end

class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_error

    def create
        rest_p = RestaurantPizza.create!(restaurant_pizza_params)
        render json: rest_p.pizza, status: :created
    end

    private 

    def restaurant_pizza_params
        params.permit(:pizza_id, :restaurant_id, :price)
    end

    def render_error(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end

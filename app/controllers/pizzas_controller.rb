class PizzasController < ApplicationController

    def index
        render json: Pizza.all.to_json  
    end

end

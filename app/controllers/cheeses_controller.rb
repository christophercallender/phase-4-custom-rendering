class CheesesController < ApplicationController
  def index
    render json: Cheese.all
  end

  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese,
             only: %i[id name price is_best_seller],
             except: %i[created_at updated_at],
             methods: [:summary]
    else
      render json: { error: "No cheeses found" }, status: :not_found
    end
  end
end

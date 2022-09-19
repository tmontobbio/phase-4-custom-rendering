class CheesesController < ApplicationController

  # GET /cheeses
  
  # def index
  #   cheeses = Cheese.all
  #   render json: cheeses
  # end

  # def index
  #   cheeses = Cheese.all
  #   render json: cheeses, only: [:id, :name, :price, :is_best_seller]
  # end

  def index
    cheeses = Cheese.all
    render json: cheeses, except: [:created_at, :updated_at]
  end

  # GET /cheeses/:id
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   render json: {
  #     id: cheese.id,
  #     name: cheese.name,
  #     price: cheese.price,
  #     is_best_seller: cheese.is_best_seller
  #   }
  # end

  # does same as above but only returns what we want from the table, also calls the summary method we put in the model
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
  # end

  #conditional to add an error if cheese isnt found
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   if cheese
  #     render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
  #   else
  #     render json: { error: 'Cheese not found' }
  #   end
  # end

  # added status: :not_found which will throw a 404
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      # status: :not_found will produce a 404 status code
      render json: { error: 'Cheese not found' }, status: :not_found
    end
  end
end

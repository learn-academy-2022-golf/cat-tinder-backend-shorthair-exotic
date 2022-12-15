class CatsController < ApplicationController
    def index
        cats = Cat.all
        render json: cats
    end
    def create
     # Creates a new cat
    cat = Cat.create(cat_params)
    render json: cat
  end

  # Handle strong parameters, so we are secure
  #private stops people from adding to our api  
  private
  def cat_params
    params.require(:cat).permit(:name, :age, :enjoys, :image)
    end
end



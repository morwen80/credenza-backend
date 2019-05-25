class FooditemsController < ApplicationController
  before_action :set_fooditem, only: [:update, :destroy]

  def index
    @fooditems = Fooditem.all
    render json: @fooditems
  end

  def create
    @fooditem = Fooditem.new(food: params[:food], itemnumber: params[:itemnumber], list_id: params[:list_id], faved: params[:faved])
    # (params.require(:food).permit(:itemnumber, :list_id))
    if @fooditem.save
      render json: @fooditem
    else
      render json: {error: 'Unable to add food item'}, status: 400
    end
  end

  def update
    # @fooditem = FoodItem.find_by(id: params[:id])
    @fooditem.update(params.permit(:food, :itemnumber, :list_id, :faved))
    render json: @fooditem, status: 200
  end

  def show
    @fooditem = Fooditem.find_by(id: params[:id])
    if @fooditem
      render json: @fooditem
    else
      render json: {error: "Food item not found"}, status: 404
    end
  end


  def destroy
    foodItemId = @fooditem.id
    @fooditem.destroy
    render json: {message:"Food item deleted", foodItemId:foodItemId}
  end


  private
  def set_fooditem
    @fooditem = Fooditem.find(params[:id])
  end

  # private
  #   def food_item_params
  #     params.require(:fooditem).permit(:food, :itemnumber)
  #   end
  end

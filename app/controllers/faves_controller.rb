class FavesController < ApplicationController
  before_action :set_fave, only: [:update, :destroy]


  def index
    @faves = Fave.all
    render json: @faves
  end

  def create
    @fave = Fave.new(food: params[:food])
    # (params.require(:food).permit(:itemnumber, :list_id))
    if @fave.save
      render json: @fave
    else
      render json: {error: 'Unable to add favourite'}, status: 400
    end
  end

  def update
    # @fave = Fave.find_by(id: params[:id])
    @fave.update(params.permit(:food))
    render json: @fave, status: 200
  end

  def show
    @fave = Fave.find_by(id: params[:id])
    if @fave
      render json: @fave
    else
      render json: {error: "Favourite not found"}, status: 404
    end
  end


  def destroy
    faveId = @fave.id
    @fave.destroy
    render json: {message:"Favourite deleted", faveId:foodItemId}
  end


  private
  def set_fave
    @fave = Fave.find(params[:id])
  end
end

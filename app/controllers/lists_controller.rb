class ListsController < ApplicationController
  def index
    @lists = List.all
    render json: @lists
end

  def show
    @list = List.find_by(id: params[:id])
    if @list
      render json: @list
    else
      render json: {error: 'List not found.'}, status: 404
    end
  end

end

class ListsController < ApplicationController

#  http_basic_authenticate_with name: "doozer", password: "tl"
  before_filter :authenticate_user!

  def new
    @list = List.new
  end

  def create
   @list = List.new(params[:list].permit(:title, :description, :user_id))
   @list.user_id = current_user.id
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = current_user.lists
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params[:list].permit(:title, :description))
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
    def list_params
      params.require(:list).permit(:title, :description)
    end
end

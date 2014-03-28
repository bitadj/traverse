class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :verify_logged_in

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])

    if @list.user_id == current_user.id
      render action: 'show'
    else
      redirect_to root_path
    end
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @list.update(list_params) && @list.user_id = current_user.id
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @list.user_id = current_user.id
      @list.destroy
      redirect_to lists_url
    else
      redirect_to 'index', error: 'You must own this list in order to delete it.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(
        :name, :user_id, :location_ids => []
      )
    end

end

class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
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

    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def removeloc
    # binding.pry
    @list = List.find(params[:id])
    @list.location_ids -= [params[:location].to_i]
    redirect_to lists_path
  end

  def destroy
    @list.destroy
    redirect_to lists_url
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

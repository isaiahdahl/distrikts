class DistriktsController < ApplicationController
  before_action :task, only: [:edit, :show, :update, :destroy]
  def index
    @distrikts = Distrikt.all
    @user = User.first
  end

  def show
  end

  def new
    @distrikt = Distrikt.new(distrikt_params)
  end

  def create
    @distrikt = Distrikt.new(distrikt_params)
    @distrikt.save
    redirect_to distrikts_path
  end

  def edit
  end

  def update
    @distrikt.update(distrikt_params)
    redirect_to distrikts_path
  end

  def destroy
    @distrikt.destroy
    redirect_to distrikts_path
  end

  private
  def distrikt_params
    params.require(:distrikt).permit(:name, :description)
  end

  def distrikt
    @distrikt = Distrikt.find(params[:id])
  end
end
class OwnersController < ApplicationController

  def show
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
    if @owner.id == current_owner.id
    else
      redirect_to "/sessions/new"
    end
  end

  def owner_params
    params.require(:owner).permit(:name, :age, :gender, :picture)
  end
end

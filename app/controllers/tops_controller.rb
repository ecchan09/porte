class TopsController < ApplicationController
  def index

    if user_signed_in?
      @owners = Owner.all
      rooms = current_user.rooms
      #自分が入ってるroomの相手のidを格納する
      @owner_ids = []
      rooms.each do |r|
        @owner_ids << r.owner_id
      end

    elsif owner_signed_in?
      @users = User.all
      rooms = current_owner.rooms
      #自分が入ってるroomの相手のidを格納する
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end

    if params[:search] == nil
      @search = []
    elsif params[:search] == ""
      @search = Owner.all
    else
    #部分検索
      @search = Owner.where("station LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def search
    if params[:search] == nil
      @search = Owner.all
    elsif params[:search] == ""
      @search = Owner.all
    else
    #部分検索
      @search = Owner.where("station LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def show
    @owner = Owner.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
    @user = User.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      redirect_to :action => "show", :id => @owner.id
    else
      redirect_to :action => "new"
    end
  end

  def owner_params
    @owner = Owner.find(params[:id])
    params.require(:owner).permit(:body)
  end
end

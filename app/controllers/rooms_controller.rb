class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id]) #ルーム情報の取得
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    if user_signed_in?
      if @room.user.id == current_user.id
        @owner = @room.owner
      else
        redirect_to "/"
      end
    elsif owner_signed_in?
      if @room.owner.id == current_owner.id
        @user = @room.user
      else
        redirect_to "/"
      end

    else
      redirect_to "/"
    end
  end

  def create
    if user_signed_in?
      #userがログインしてたらuser_idを, ownerがログインしてたらowner_idを@roomにいれる
      @room = Room.new(room_owner_params)
      @room.user_id = current_user.id
    elsif owner_signed_in?
      @room = Room.new(room_user_params)
      @room.owner_id = current_owner.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  private
  def room_owner_params
    params.require(:room).permit(:owner_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end

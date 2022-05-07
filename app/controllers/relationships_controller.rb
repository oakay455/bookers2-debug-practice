class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  #フォローするとき
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end
  #フォローを外すとき
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  #あるユーザーがフォローしている人一覧（フォロー一覧）
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  #あるユーザーをフォローしている人一覧(フォロワー一覧)
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end

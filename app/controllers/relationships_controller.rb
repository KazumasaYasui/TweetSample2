class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationships.build(following_id: @user.id)
    if @follow.save
      redirect_to posts_path, notice: "フォローしました"
    else
      redirect_to posts_path, alert: "フォローできません"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationships.find_by!(following_id: @user.id)
    @follow.destroy
    redirect_to posts_path, notice: "フォロー解除しました"
  end

end

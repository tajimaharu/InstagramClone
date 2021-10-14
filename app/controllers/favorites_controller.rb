class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(instaclone_id: params[:instaclone_id])
    redirect_to instaclones_path, notice: "#{favorite.instaclone.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to instaclones_path, notice: "#{favorite.instaclone.user.name}さんのブログをお気に入り解除しました"
  end
end

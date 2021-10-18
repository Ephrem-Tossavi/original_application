class FavoritesController < ApplicationController
    def index
        @favorites = current_user.favorites.all 
        puts @favorites
    end

    def create
        favorite = current_user.favorites.create(post_id: params[:post_id])
        redirect_to posts_path, notice: "#{favorite.post.user.name}'S post has been added to favorites"
      end

    def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to posts_path, notice: "#{favorite.post.user.name}Unpostged Mr.'s post"
    end
end

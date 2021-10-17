class UsersController < ApplicationController

    def index
        @users = User.all
        @users = User.all.order("created_at desc")
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = current_user
    end

    def search 
        session[:search_users] = {'name' => params[:search_title], 'status' => params[:search_status]}
       
        if params[:search_title].present?
          if params[:search_status].present?
          @users = User.all.title_search(params[:search_title]).order_by_status(params[:search_status])
          else
          @users = User.all.title_search(params[:search_title])
          end

        elsif params[:search_status].present?
        @users = User.all.order_by_status(params[:search_status]) 
         else
        @users = User.all
         end  
       render :index
    end
end


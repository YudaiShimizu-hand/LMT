require 'user_detail'
class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    before_action :current_user_only, only: [:show, :edit, :update, :destroy]

    def show
        @user = User.find_by(id: params[:id])
        @myChannel = @user.channels.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        # @user.update(user_params)
        @user.update(username: params[:username], email: params[:email])
        if @user.user_detail.nil?
            @userDetail = UserDetail.new(user_id: @user.id, image: params[:image], company_name: params[:company_name])
            @userDetail.save
        else
            @user.user_detail.update(image: params[:image], company_name: params[:company_name])
        end
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :image, :company_name)
    end

    def current_user_only
        @user_id = User.find(params[:id])
        if @user_id.id != current_user.id
            redirect_to root_path
        end
    end

end

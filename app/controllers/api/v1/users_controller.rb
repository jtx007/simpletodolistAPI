module Api
    module V1
        class UsersController < ApplicationController

            def create
                @user = User.new(user_parans)
                if @user.save
                    render json: @user, status: :created
                else 
                    render json: @user.errors, status: :unprocessable_entity
                end
            end

            private

            def user_params
                params.require(:user).permit(:username, :password)
            end
        end
    end
end

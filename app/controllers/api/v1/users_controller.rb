module Api
    module V1
        class UsersController < ApplicationController

            def create
                @user = User.new(user_params)
                if @user.save
                    render json: @user, status: :created
                else 
                    render json: @user.errors, status: :unprocessable_entity
                end
            end

            def login
                auth_object = Authentication.new(login_params)
                if auth_object.authenticate
                    token = auth_object.generate_token
                    render json: {message: "Login successful!", token: token }, status: :ok
                else
                render json: {message: "Incorrect username/password combination"}, status: :unauthorized
                end
            end

            private

            def user_params
                params.require(:user).permit(:username, :password)
            end

            def login_params
                params.require(:user).permit(:username, :password)
            end
        end
    end
end

module Api
    module V1
        class ListsController < ApplicationController
            

            def index
                @lists = List.all
            end

            def create
                authorization_object = Authorization.new(request)
                current_user_id = authorization_object.current_user
                current_user = User.find(current_user_id)
                debugger
                if current_user
                    list_params[:user_id] = current_user.id
                    @list = List.new(list_params)
                    if @list.save
                    render json: @list, status: :created
                    else
                    render json: @list.errors, status: :unprocessable_entity
                    end
                else 
                    render json: {message: "Please login first"}, status: :unauthorized
                end
            end


            private
            def list_params
                params.require(:list).permit(:name, :duedate)
            end

        end
    end
end

module Api
    module V1
        class ListsController < ApplicationController

            def index
                @lists = List.all
            end

            def create
                
                @list = List.new(list_params)
                if @list.save
                    render json: @list, status: :created
                else
                    render json: @list.errors, status: :unprocessable_entity
                end
            end


            private
            def list_params
                params.require(:list).permit(:name, :duedate, :user_id)
            end

        end
    end
end

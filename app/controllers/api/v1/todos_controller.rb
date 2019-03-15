module Api
     module V1
        class TodosController < ApplicationController

            def index
                @todos = Todos.all
            end

            def create
                @todo = Todo.new(todo_params)
                if @todo.save
                    render json: @todo, status: :created
                else
                    render json: @todo.errors,  status: :unprocessable_entity
                end
            end

            private
            def todo_params
                params.require(:todo).permit(:todo_name, :list_id, :user_id)
            end
            
        end
    end
end




class ApplicationController < ActionController::API
    include ExceptionHandler

    def authorize
        puts 'hello'
        authorize =  Authorization.new(request)
        
        puts authorize.current_user
    end
end

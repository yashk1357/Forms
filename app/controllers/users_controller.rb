class UsersController < ApplicationController
    def index
        @user = User.all
    end 
    def new 
        @user = User.new
    end
    def create 
        @user = User.new(user_params)
       # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
           #render plain: "Your form is subbmited"
            redirect_to new_user_path, notice: "user added successfully!"

        else
            #flash[:alert] = "something was wrong"
            render :new , status: :unprocessable_entity
        end   
              
    end
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
    
end

class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to home_main_path, notice: 'Logged in successfully'
        else
            flash.now[:alert] = 'Invalid email or password'
            render :new, status: :unprocessable_entity 
        end
    end

    def destroy
        logout
        redirect_to root_path, notice: 'Logged out successfully'
    end

end

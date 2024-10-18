class HomeController < ApplicationController
    before_action:authenticate_user!
    before_action:user_signed_in?
    def main
        @user = current_user
    end
end

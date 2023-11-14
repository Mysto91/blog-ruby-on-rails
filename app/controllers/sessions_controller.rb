class SessionsController < ApplicationController
    def destroy
        logout
        redirect_to root_path, notice: "You have been logged out"
    end
end

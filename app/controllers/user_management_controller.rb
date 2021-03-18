class UserManagementController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    before_action :save_return_path, only: %i[ index ]
  
    # GET /users_namagement
    def index
      @users = User.all
    end
end
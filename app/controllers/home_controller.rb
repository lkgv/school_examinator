class HomeController < ApplicationController
  before_action :save_return_path, only: %i[ index ]
  before_action :set_activities
  def index
  end

  protected
  def set_activities
    @activities =
      if current_user && current_user.admin?
        Activity.all.where(date: Date.today)
      elsif current_user
        current_user.activities.where(date: Date.today)
      else
        []
      end
  end

end

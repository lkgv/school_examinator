class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show destroy ]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: %i[ new create destroy ]
  before_action :save_return_path, only: %i[ show index ]

  # GET /activities or /activities.json
  def index
    if current_user.admin?
      @activities = Activity.all
    else
      @activities = Activity.where(class_org_id: current_user.class_org_ids)
    end
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # POST /activities or /activities.json
  def create
    @std_activity = StdActivity.find_by_id activity_params[:std_activity_id]
    params[:activity][:description] = @std_activity.description
    params[:activity][:score] = @std_activity.score
    params[:activity][:exam_item_id] = @std_activity.exam_item_id

    @activity = Activity.new(activity_params)
    respond_to do |format|
      if @activity.save
        format.html { redirect_to return_path, notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to return_path, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:std_activity_id, :description, :score, :date, :exam_item_id, :class_org_id)
    end
end

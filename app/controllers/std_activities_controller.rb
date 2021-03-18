class StdActivitiesController < ApplicationController
  before_action :set_std_activity, only: %i[ show edit update destroy ]
  before_action :set_exam_item
  before_action :save_return_path, only: %i[ show index ]
  before_action :authenticate_user!
  before_action :authenticate_admin

  # GET /std_activities or /std_activities.json
  def index
    @std_activities = @exam_item.std_activities
  end

  # GET /std_activities/1 or /std_activities/1.json
  def show
  end

  # GET /std_activities/new
  def new
    @std_activity = StdActivity.new
  end

  # POST /std_activities or /std_activities.json
  def create
    params[:std_activity][:exam_item_id] = @exam_item.id
    @std_activity = StdActivity.new(std_activity_params)

    respond_to do |format|
      if @std_activity.save
        format.html { redirect_to return_path, notice: "Std activity was successfully created." }
        format.json { render :show, status: :created, location: @std_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @std_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /std_activities/1 or /std_activities/1.json
  def destroy
    @std_activity.destroy
    respond_to do |format|
      format.html { redirect_to return_path, notice: "Std activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_std_activity
      @std_activity = StdActivity.find(params[:id])
    end

    def set_exam_item
      @exam_item = ExamItem.find(params[:exam_item_id])
    end

    # Only allow a list of trusted parameters through.
    def std_activity_params
      params.require(:std_activity).permit(:description, :score, :exam_item_id)
    end

end

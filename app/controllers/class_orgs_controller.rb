class ClassOrgsController < ApplicationController
  before_action :set_class_org, only: %i[ show edit update destroy new_activity create_activity]
  before_action :set_class_orgs
  before_action :save_return_path, only: %i[ index show ]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: %i[ destroy ]

  # GET /class_orgs or /class_orgs.json
  def index    
  end

  # GET /class_orgs/1 or /class_orgs/1.json
  def show
    @activities = @class_org.activities
  end

  # GET /class_orgs/new
  def new
    @class_org = ClassOrg.new
  end

  # GET /class_orgs/1/edit
  def edit
  end

  # POST /class_orgs or /class_orgs.json
  def create
    unless current_user.admin?
      params[:class_org][:user_id] = current_user.id
    end
    @class_org = ClassOrg.new(class_org_params)

    respond_to do |format|
      if @class_org.save
        format.html { redirect_to return_path, notice: "Class Org was successfully created." }
        format.json { render :show, status: :created, location: @class_org }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_orgs/1 or /class_orgs/1.json
  def update
    unless current_user.admin?
      params[:class_org][:user_id] = current_user.id
    end
    respond_to do |format|
      if @class_org.update(class_org_params)
        format.html { redirect_to return_path, notice: "Class Org was successfully updated." }
        format.json { render :show, status: :ok, location: @class_org }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_orgs/1 or /class_orgs/1.json
  def destroy
    @class_org.destroy
    respond_to do |format|
      format.html { redirect_to return_path, notice: "Class Org was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_activity
    @activity = Activity.new
  end

  # POST /activities or /activities.json
  def create_activity
    @std_activity = StdActivity.find_by_id activity_params[:std_activity_id]
    params[:activity][:description] = @std_activity.description
    params[:activity][:score] = @std_activity.score
    params[:activity][:exam_item_id] = @std_activity.exam_item_id
    params[:activity][:class_org_id] = @class_org.id

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

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_class_org
      @class_org = ClassOrg.find(params[:id])
    end

    def set_class_orgs
      if current_user.admin?
        @class_orgs = ClassOrg.all
      else
        @class_orgs = ClassOrg.where(user_id: current_user.id)
      end
    end

    # Only allow a list of trusted parameters through.
    def class_org_params
      params.require(:class_org).permit(:grade, :number, :score, :user_id)
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:std_activity_id, :description, :score, :date, :exam_item_id, :class_org_id)
    end
end

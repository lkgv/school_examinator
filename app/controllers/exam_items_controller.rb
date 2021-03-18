class ExamItemsController < ApplicationController
  before_action :set_exam_item, only: %i[ show edit update destroy ]
  after_action :save_return_path, only: %i[ index ]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: %i[new, edit, create, update, destroy]

  # GET /exam_items or /exam_items.json
  def index
    @exam_items = ExamItem.all
  end

  # GET /exam_items/1 or /exam_items/1.json
  def show
    redirect_to exam_item_std_activities_path(@exam_item)
  end

  # GET /exam_items/new
  def new
    @exam_items = ExamItem.all
    @exam_item = ExamItem.new
  end

  # GET /exam_items/1/edit
  def edit
    @exam_items = ExamItem.all
  end

  # POST /exam_items or /exam_items.json
  def create
    @exam_item = ExamItem.new(exam_item_params)

    respond_to do |format|
      if @exam_item.save
        format.html { redirect_to return_path, notice: "Exam item was successfully created." }
        format.json { render :show, status: :created, location: @exam_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_items/1 or /exam_items/1.json
  def update
    respond_to do |format|
      if @exam_item.update(exam_item_params)
        format.html { redirect_to return_path, notice: "Exam item was successfully updated." }
        format.json { render :show, status: :ok, location: @exam_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_items/1 or /exam_items/1.json
  def destroy
    @exam_item.destroy
    respond_to do |format|
      format.html { redirect_to return_path, notice: "Exam item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_item
      @exam_item = ExamItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_item_params
      params.require(:exam_item).permit(:name)
    end
end

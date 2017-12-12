class ResultsController < ApplicationController
  before_action :set_results
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET exams/1/results
  def index
    @results = @exam.results
  end

  # GET exams/1/results/1
  def show
  end

  # GET exams/1/results/new
  def new
    @result = @exam.results.build
  end

  # GET exams/1/results/1/edit
  def edit
  end

  # POST exams/1/results
  def create
    @result = @exam.results.build(result_params)

    if @result.save
      redirect_to([@result.exam.course, @result.exam, @result], notice: 'Result was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT exams/1/results/1
  def update
    if @result.update_attributes(result_params)
      redirect_to([@result.exam.course, @result.exam, @result], notice: 'Result was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE exams/1/results/1
  def destroy
    @result.destroy

    redirect_to course_exam_results_url(@result.exam.course, @exam)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_results
      @exam = Exam.find(params[:exam_id])
    end

    def set_result
      @result = @exam.results.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def result_params
      params.require(:result).permit(:score, :student_id)
    end
end

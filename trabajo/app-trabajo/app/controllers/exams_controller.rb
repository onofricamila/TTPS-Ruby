class ExamsController < ApplicationController
  before_action :set_exams
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :results, :change_results]

  def results
    @exam.course.students.each do |std|
      @exam.results.find_or_initialize_by(student: std)
    end
  end

  def change_results
    if @exam.update(results_params)
      redirect_to(results_course_exam_url(@exam.course, @exam), notice: 'Scores updated')
    else
      render action: 'results'
    end
  end

  # GET courses/1/exams
  def index
    @exams = @course.exams.order(:date)
  end

  # GET courses/1/exams/new
  def new
    @exam = @course.exams.build
  end

  # GET courses/1/exams/1/edit
  def edit
  end

  # POST courses/1/exams
  def create
    @exam = @course.exams.build(exam_params)

    if @exam.save
      redirect_to( course_exams_url(@exam.course), notice: 'Exam was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT courses/1/exams/1
  def update
    if @exam.update_attributes(exam_params)
      redirect_to( course_exams_url(@exam.course), notice: 'Exam was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE courses/1/exams/1
  def destroy
    @exam.destroy
    if (!@exam.results.empty?)
      respond_to do |format|
        format.html { redirect_to course_exams_url(@course), alert: 'Exam was not destroyed due to the fact it has results related.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to course_exams_url(@course), notice: 'Exam was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exams
      @course = Course.find(params[:course_id])
    end

    def set_exam
      @exam = @course.exams.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exam_params
      params.require(:exam).permit(:title, :passing_score, :date)
    end

    def results_params
      params.require(:exam).permit(results_attributes: [:id, :score, :student_id])
    end
end

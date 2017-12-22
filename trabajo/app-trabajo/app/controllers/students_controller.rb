class StudentsController < ApplicationController
  before_action :set_students
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET courses/1/students
  def index
    @students = @course.students.order(:surname, :name)
  end

  # GET courses/1/students/new
  def new
    @student = @course.students.build
  end

  # GET courses/1/students/1/edit
  def edit
  end

  # POST courses/1/students
  def create
    @student = @course.students.build(student_params)

    if @student.save
      redirect_to( course_students_url(@student.course), notice: 'Student was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT courses/1/students/1
  def update
    if @student.update_attributes(student_params)
      redirect_to( course_students_url(@student.course), notice: 'Student was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE courses/1/students/1
  def destroy
    @student.destroy
    if (!@student.results.empty?)
      respond_to do |format|
        format.html { redirect_to course_students_url(@course), alert: 'Student was not destroyed due to the fact it has results related.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to course_students_url(@course), notice: 'Student was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students
      @course = Course.find(params[:course_id])
    end

    def set_student
      @student = @course.students.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:surname, :name, :number, :dni, :email)
    end
end

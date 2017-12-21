class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :summary]
  
  # added by me so as to render the summary asked
  # GET /courses/:id/summary --> courses#summary
  def summary
  end
  
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.order(year: :desc)
  end
  
  # GET /courses/new
  def new
    @course = Course.new
  end
  
  # GET /courses/1/edit
  def edit
    if @course.exams.empty?
      render 'edit'
    else
      redirect_to(courses_url, alert: "Course's year can not be updated cause there are exams related to this course which are going to have an invalid date")
    end
  end
  
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    
    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: courses_path }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to  courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: courses_path }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    if (!@course.exams.empty? || !@course.students.empty?)
      respond_to do |format|
        format.html { redirect_to courses_url, alert: 'Course was not destroyed due to the fact it has exams or students related.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:year)
  end
end

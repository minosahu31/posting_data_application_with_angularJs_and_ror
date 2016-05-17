class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
    render json: {success: true, students: @students}
  end

  def show
    render json: { success: true, student: @student }
  end

  def new
    @student = Student.new
    render json: { success: true, student: @student }
  end

  def create
    @student = Student.new(student_params)
    if @student.save
        @students = Student.all
        render json: { success: true, students: @students }
    else
        render json: { success: false, student_errors: @student.errors, status: unprocessable_entity }
    end
  end

  def edit
    render json: { success: true, student: @student }
  end

  def update
    if @student.update(student_params)
      @students = Student.all
        render json: { success: true, students: @students }
    else
        render json: { success: false, student_errors: @student.errors, status: unprocessable_entity }
    end
  end

  def destroy
    if @student.destroy
      @students = Student.all
        render json: { success: true, students: @students }
    end
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:name, :email, :dob, :age )
  end

end

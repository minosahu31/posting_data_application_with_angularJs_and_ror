class StudentsController < ApplicationController
  before_action :find_student, only: [:create, :edit, :update, :destory]

  def index
    @students = Student.all
    render json: {success: true, students: @students}
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      redner "edit"
    end
  end

  def destory
    if @student.destory
      redirect_to students_path
    end
  end
end

class StudentsController < ApplicationController
  def index
    @students = Student.includes(:school)
  end
end

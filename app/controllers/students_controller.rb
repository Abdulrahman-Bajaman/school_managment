class StudentsController < ApplicationController
  before_action :set_student, only: :show
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end


class StudentsController < ApplicationController
  before_action :set_student, only: %i[ destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def destroy
    if @student.destroy
    render json: { message: "Student deleted successfully" }, status: :ok
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Student not found" }, status: :not_found
  end
end

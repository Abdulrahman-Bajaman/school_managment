class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update]
  before_action :set_schools, only: [:edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def edit
  end

  def update
    if @student.update(student_params)
   flash[:success] = "Student updated successfully"
       redirect_to edit_student_path
    else
      flash.now[:error] = @student.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def set_schools
    @schools = School.all
  end

  def student_params
    params.require(:student).permit(:full_name, :status, :date_of_birth, :address, :phone_number, :school_id)
  end

  def render_not_found_response
    render json: { error: "Student not found" }, status: :not_found
  end
end


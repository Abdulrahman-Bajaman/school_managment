class SchoolsController < ApplicationController
  before_action :set_school, only: %i[edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def edit
  end

  def update
    if @school.update(school_params)
      render json: { message: "Updated successfully", school: @school }, status: :ok
    else
      render json: { message: "Failed to update", errors: @school.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def school_params
    params.require(:school).permit(:name_en, :name_ar, :address, :status)
  end

  def set_school
    @school = School.find(params[:id])
  end

  def render_not_found
    render json: { error: "School not found with id #{params[:id]}" }, status: :not_found
  end
end


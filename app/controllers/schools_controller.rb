class SchoolsController < ApplicationController
  before_action :set_school, only: %i[destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def destroy
    if @school.destroy
      render json: { message: "School #{@school.name_ar} destroyed" }, status: :ok
    else
      render json: { 
        message: "School with id #{params[:id]} could not be destroyed", 
        errors: @school.errors.full_messages 
      }, status: :unprocessable_entity  
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def render_not_found
    render json: { error: "School not found with id #{params[:id]}" }, status: :not_found
  end
end

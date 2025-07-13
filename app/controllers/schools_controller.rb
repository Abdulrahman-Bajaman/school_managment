class SchoolsController < ApplicationController
  before_action :set_school, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
    # render json: {
    #   id: @school.id,
    #   name_ar: @school.name_ar,
    #   name_en: @school.name_en,
    #   address: @school.address,
    #   status: @school.status
    # }
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def render_not_found
    render json: { error: "School not found" }, status: :not_found
  end
end


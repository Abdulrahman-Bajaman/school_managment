class SchoolsController < ApplicationController
  before_action :set_school, only: %i[edit update]

  def edit
    @school
  end

  def update 
    if @school.update(school_params)
      render plain: "updated successfully"
    else
      render plain: "failed to update"
    end
  end

  private

  def school_params
    params.require(:school).permit(:name_en, :name_ar, :address, :status)
  end

  def set_school
    @school = School.find(params[:id])
  end
end

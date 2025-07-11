class SchoolsController < ApplicationController
  def new
    @school = School.new
  end


  def create
    @school = School.create(school_params)  # calls Model.create which builds and saves in one step

    if @school.persisted?   # checks if saved successfully
      render plain: "success", status: :created
    else
      render plain: "failed", status: :unprocessable_entity
    end
  end

  private 

  def school_params
    params.require(:school).permit(:name_en, :name_ar, :address, :status)
  end

end

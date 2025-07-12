class StudentsController < ApplicationController
  before_action :set_schools, only: [:new, :create]

  def new
    @student = Student.new
    # @schools = School.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
       flash[:success] = "Student created successfully"
       redirect_to new_student_path
      # render json: {
      #   data:@student,
      #   status: :created,
      #   message: "Student created successfully"
      # }
    else
      flash.now[:error] = @student.errors.full_messages.join(", ")
      # @schools = School.all
      # Using `render` will NOT send a new request to the client — 
      # it just re-renders the form in the current request and preserves form data.
      # So use `flash.now[:error]` here to show error messages immediately.

      # If you use `redirect_to new_student_path`, this sends a new request to the client,
      # which clears the form data, so you lose user input.
      # In that case, use `flash[:error]` (without `.now`) to persist the error message across the redirect.
      render :new, status: :unprocessable_entity   
    end
  end


  private 

  def student_params
    params.require(:student).permit(:full_name, :status, :school_id, :date_of_birth, :address, :phone_number)
  end


  def set_schools
    @schools = School.all
  end


end


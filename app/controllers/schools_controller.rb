class SchoolsController < ApplicationController
  ALLOWED_FILTERS = {
    "name_en" => "name_en",
    "name_ar" => "name_ar",
    "status"  => "status"
  }.freeze

  def index
    @schools = School.all
  end

  def search
    filter_param = params[:filter]
    # strip remove leading and trailing spaces
    term_search = params[:term_search].to_s.strip

    if term_search.present? && ALLOWED_FILTERS.key?(filter_param)
      column = ALLOWED_FILTERS[filter_param]
      # ILike case insensitive small and capital are same 
      @schools = School.where("#{column} ILIKE ?", "%#{term_search}%")
    else
      @schools = School.all
    end

    render json: { schools: @schools.as_json(only: [:id, :name_en, :name_ar, :status]) }
  end
end

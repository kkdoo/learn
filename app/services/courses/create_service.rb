class Courses::CreateService < BaseService
  class UnknownAuthor < StandardError; end

  class EmptyCompetencies < StandardError; end

  def initialize(params)
    @params = params
  end

  def call
    @author = Author.find_by(id: @params[:author_id])
    raise UnknownAuthor unless @author
    raise EmptyCompetencies unless @params[:competencies].presence

    ActiveRecord::Base.transaction do
      create_course
      Competencies::CreateForCourseService.new(@course, @params[:competencies]).call
    end

    @course
  end

  protected

  def create_course
    @course = @author.courses.create!(permitted_params)
  end

  def permitted_params
    @permitted_params ||= @params.permit(:name, :description)
  end
end

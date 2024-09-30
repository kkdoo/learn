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
      @course = @author.courses.create!(permitted_params)
      @competencies_list = @params[:competencies]
      @competencies_list.each do |name|
        competency = Competency.find_or_create_by!(name:)
        @course.competency_courses.create!(competency_id: competency.id)
      end
    end

    @course
  end

  protected

  def permitted_params
    @permitted_params ||= @params.permit(:name, :description)
  end
end

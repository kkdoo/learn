class Courses::CreateService < BaseService
  class UnknownAuthor < StandardError; end

  def initialize(params)
    @params = params
  end

  def call
    @author = Author.find_by(id: @params[:author_id])
    raise UnknownAuthor unless @author

    @author.courses.create!(permitted_params)
  end

  protected

  def permitted_params
    @permitted_params ||= @params.permit(:name, :description)
  end
end

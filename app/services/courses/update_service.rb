class Courses::UpdateService < BaseService
  def initialize(id, params)
    @id = id
    @params = params
  end

  def call
    @course = Course.find(@id)
    @course.update!(permitted_params)
    @course
  end

  protected

  def permitted_params
    @permitted_params ||= @params.permit(:author_id, :name, :description)
  end
end

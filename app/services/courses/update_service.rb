class Courses::UpdateService < BaseService
  def initialize(id, params)
    @id = id
    @params = params
  end

  def call
    @course = Course.find(@id)

    ActiveRecord::Base.transaction do
      update_course
      update_competencies
    end

    @course
  end

  protected

  def update_course
    @course.update!(permitted_params)
  end

  def update_competencies
    return unless @params[:competencies].presence

    old_list = @course.competencies.pluck(:name)
    new_list = @params[:competencies].uniq

    pending_delete = old_list - new_list
    pending_add = new_list - old_list

    remove_competencies(pending_delete)
    Competencies::CreateForCourseService.new(@course, pending_add).call
  end

  def find_competencies(list)
    @course.competency_courses.joins(:competency).
      where(competencies: { name: list })
  end

  def remove_competencies(list)
    find_competencies(list).destroy_all
  end

  def permitted_params
    @permitted_params ||= @params.permit(:author_id, :name, :description)
  end
end

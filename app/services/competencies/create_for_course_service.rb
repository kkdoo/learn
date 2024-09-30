class Competencies::CreateForCourseService < BaseService
  def initialize(course, competencies_list)
    @course = course
    @competencies_list = competencies_list
  end

  def call
    create_competencies(@competencies_list)
  end

  protected

  def create_competency(name)
    competency = Competency.find_or_create_by!(name:)
    @course.competency_courses.create!(competency_id: competency.id)
  end

  def create_competencies(list)
    list.each do |name|
      create_competency(name)
    end
  end
end

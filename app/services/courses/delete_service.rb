class Courses::DeleteService < BaseService
  def initialize(id)
    @id = id
  end

  def call
    @course = Course.find(@id)
    @course.destroy
    @course
  end
end

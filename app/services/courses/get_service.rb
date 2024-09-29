class Courses::GetService < BaseService
  def initialize(id)
    @id = id
  end

  def call
    Course.find(@id)
  end
end

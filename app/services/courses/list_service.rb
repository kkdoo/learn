class Courses::ListService < BaseService
  PER_PAGE = 100

  def initialize
  end

  def call
    Course.last(PER_PAGE)
  end
end

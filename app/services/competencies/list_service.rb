class Competencies::ListService < BaseService
  PER_PAGE = 100

  def initialize
  end

  def call
    Competency.last(PER_PAGE)
  end
end

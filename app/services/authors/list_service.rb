class Authors::ListService < BaseService
  PER_PAGE = 100

  def initialize
  end

  def call
    Author.last(PER_PAGE)
  end
end

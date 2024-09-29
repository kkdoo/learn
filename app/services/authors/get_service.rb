class Authors::GetService < BaseService
  def initialize(id)
    @id = id
  end

  def call
    Author.find(@id)
  end
end

class Competencies::GetService < BaseService
  def initialize(id)
    @id = id
  end

  def call
    Competency.find(@id)
  end
end

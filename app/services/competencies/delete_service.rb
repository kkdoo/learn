class Competencies::DeleteService < BaseService
  def initialize(id)
    @id = id
  end

  def call
    @competency = Competency.find(@id)
    @competency.destroy
    @competency
  end
end

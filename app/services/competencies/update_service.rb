class Competencies::UpdateService < BaseService
  def initialize(id, params)
    @id = id
    @params = params
  end

  def call
    @competency = Competency.find(@id)
    @competency.update!(permitted_params)
    @competency
  end

  protected

  def permitted_params
    @permitted_params ||= @params.permit(:name)
  end
end

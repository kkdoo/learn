class Competencies::CreateService < BaseService
  def initialize(params)
    @params = params
  end

  def call
    Competency.create!(permitted_params)
  end

  protected

  def permitted_params
    @permitted_params ||= @params.permit(:name)
  end
end

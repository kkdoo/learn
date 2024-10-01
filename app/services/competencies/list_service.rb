class Competencies::ListService < BaseService
  PER_PAGE = 100

  def initialize(params)
    @params = params
  end

  def call
    Competency.page(@params[:page] || 1).per(@params[:per_page] || PER_PAGE)
  end
end

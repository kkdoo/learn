class Authors::UpdateService < BaseService
  def initialize(id, params)
    @id = id
    @params = params
  end

  def call
    @author = Author.find(@id)
    @author.update!(permitted_params)
    @author
  end

  protected

  def permitted_params
    @permitted_params ||= @params.permit(:first_name, :last_name)
  end
end

class Authors::CreateService
  def initialize(params)
    @params = params
  end

  def call
    Author.create!(permitted_params)
  end
      
  protected

  def permitted_params
    @permitted_params ||= @params.permit(:first_name, :last_name)
  end
end

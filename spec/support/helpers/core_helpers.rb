module CoreHelpers
  def action_params(parameters)
    ActionController::Parameters.new(parameters)
  end

  def body_json
    @body_json ||= JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include CoreHelpers
end

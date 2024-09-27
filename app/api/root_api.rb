class RootApi < Grape::API
  mount V1::AuthorsApi => "/"

  helpers do
    def declared_params
      @declared_params ||= ActionController::Parameters.new(
        declared(params, include_missing: false))
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error!({ status: 404, message: "Resource not found" }, 404)
  end

  rescue_from ActiveRecord::RecordInvalid do |error|
    Rails.logger.debug error
    Rails.logger.debug error.backtrace.join("\n\t")
    message = error.record.errors.full_messages.join(", ")
    error!({ status: 400, message: }, 400)
  end
end

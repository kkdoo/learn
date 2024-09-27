class RootApi < Grape::API
  mount V1::AuthorsApi => "/"

  helpers do
    def declared_params
      @declared_params ||= ActionController::Parameters.new(
        declared(params, include_missing: false))
    end
  end

  rescue_from Grape::Exceptions::ValidationErrors do |error|
    Rails.logger.debug error
    Rails.logger.debug error.backtrace.join("\n\t")

    errors = error.map do |attrs, message|
      attr = attrs.first
      { name: attr, messages: [ message.to_s ] }
    end
    error!({ status: 400, errors: }, 400)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error!({ status: 404, errors: ['Resource not found'] }, 404)
  end
end

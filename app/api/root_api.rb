class RootApi < Grape::API
  mount V1::AuthorsApi => "/"
  mount V1::CoursesApi => "/"
  mount V1::CompetenciesApi => "/"

  helpers do
    def declared_params
      @declared_params ||= ActionController::Parameters.new(
        declared(params, include_missing: false)
      )
    end
  end

  rescue_from Grape::Exceptions::ValidationErrors do |error|
    Rails.logger.debug error
    Rails.logger.debug error.backtrace.join("\n\t")

    errors = error.map do |attrs, message|
      attr = attrs.first
      { name: attr, messages: [message.to_s] }
    end
    error!({ status: 400, errors: }, 400)
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    error!({ status: 404, errors: ['Resource not found'] }, 404)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    errors = e.record.errors.errors.map do |error|
      { name: error.attribute, messages: [error.message.to_s] }
    end
    error!({ status: 400, errors: }, 400)
  end

  rescue_from :all do |error|
    Rails.logger.debug error
    Rails.logger.debug error.backtrace.join("\n\t")

    error!({ status: 500, errors: ['Internal error'] }, 500)
  end
end

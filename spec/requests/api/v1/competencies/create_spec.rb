require 'swagger_helper'

describe 'Competencies API' do
  path '/v1/competencies' do
    post 'Creates a competency' do
      tags 'Competencies'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :competency_params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: %w(name),
      }

      request_body_example(
        value: {
          name: 'rails',
        },
        name: 'competency_create', summary: 'Successful create'
      )

      response '201', 'created a new competency' do
        schema '$ref' => '#/components/schemas/competency_entity'

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          author_id: SecureRandom.uuid,
          name: 'Web competency',
          description: 'Web competency details',
        }

        let(:competency_params) { { name: 'rails' } }

        run_test!
      end

      request_body_example value: { name: 'rails' },
        name: 'competency_missing_params', summary: 'Validation error'

      response '400', 'invalid request' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 400,
          errors: {
            name: 'name',
            messages: ['is missing'],
          },
        }

        let(:competency_params) { { name: 'rails' } }

        run_test!
      end
    end
  end
end

require 'swagger_helper'

describe 'Competencies API' do
  path '/v1/competencies/{id}' do
    put 'Update a competency' do
      tags 'Competencies'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :competency_params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
      }

      request_body_example(
        value: {
          name: 'rails',
        },
        name: 'competency_create', summary: 'Successful create'
      )

      response '200', 'update a competency by id' do
        schema '$ref' => '#/components/schemas/competency_entity'

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          name: 'rails',
        }

        let(:competency) { create(:competency) }
        let(:competency_params) { { name: 'django' } }
        let(:id) { competency.id }

        run_test!
      end

      response '404', 'competency not found' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 404,
          errors: ['Resource not found'],
        }

        let(:competency_params) { { name: 'rails' } }
        let(:id) { 'invalid' }

        run_test! do |response|
          expect(body_json['errors']).to eq(['Resource not found'])
        end
      end
    end
  end
end

require 'swagger_helper'

describe 'Competencies API' do
  path '/v1/competencies/{id}' do
    delete 'Delete a competency' do
      tags 'Competencies'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      request_body_example value: {},
        name: 'competency_delete', summary: 'Successful delete'

      response '200', 'delete a competency by id' do
        schema type: 'object',
          properties: {
            id: { type: 'string' },
          },
          required: ['id']

        example 'application/json', :example, {
          id: SecureRandom.uuid,
        }

        let(:competency) { create(:competency) }
        let(:id) { competency.id }

        run_test!
      end

      response '404', 'competency not found' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 404,
          errors: ['Resource not found'],
        }

        let(:id) { 'invalid' }

        run_test! do |response|
          expect(body_json['errors']).to eq(['Resource not found'])
        end
      end
    end
  end
end

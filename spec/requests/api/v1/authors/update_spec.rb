require 'swagger_helper'

describe 'Authors API' do
  path '/v1/authors/{id}' do
    put 'Update an author' do
      tags 'Authors'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :author_params, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string }
        },
        required: [ 'first_name', 'last_name' ]
      }

      request_body_example value: { },
        name: 'author_update', summary: 'Successful update'

      response '200', 'update an author by id' do
        schema '$ref' => '#/components/schemas/author_entity'

        example 'application/json', :example, {
          id:,
          first_name: 'Bob',
          last_name: 'Marley',
        }

        let(:author) { create(:author) }
        let(:author_params) { { first_name: 'John' } }
        let(:id) { author.id }

        run_test!
      end

      request_body_example value: { first_name: 'Bob' },
        name: 'author_missing_params', summary: 'Validation error'

      response '404', 'author not found' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 404,
          errors: ['Resource not found']
        }

        let(:author_params) { { first_name: 'John' } }
        let(:id) { 'invalid' }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['errors']).to eq(['Resource not found'])
        end
      end
    end
  end
end

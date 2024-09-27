require 'swagger_helper'

describe 'Authors API' do
  path '/v1/authors/{id}' do
    get 'Get a author by id' do
      tags 'Authors'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      request_body_example value: { },
        name: 'author_get', summary: 'Success error'

      response '200', 'find author by id' do
        schema '$ref' => '#/components/schemas/author_entity'

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          first_name: 'Bob',
          last_name: 'Marley',
        }

        let(:author) { create(:author) }
        let(:id) { author.id }

        run_test!
      end

      response '404', 'invalid request' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 404,
          errors: ['Resource not found']
        }

        let(:id) { 'invalid' }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['errors']).to eq(['Resource not found'])
        end
      end
    end
  end
end

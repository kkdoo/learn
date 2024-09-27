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
        required: [ 'id', 'first_name', 'last_name' ]
      }

      request_body_example value: { first_name: 'Bob', last_name: 'Marley' },
        name: 'author_update', summary: 'Successful update'

      response '200', 'update an author by id' do
        schema '$ref' => '#/components/schemas/author_entity'

        example 'application/json', :example, {
          id:,
          first_name: 'Bob',
          last_name: 'Marley',
        }

        let(:author) { create(:author) }
        let(:author_params) { { first_name: 'John', last_name: 'Snow' } }
        let(:id) { author.id }

        before do
          expect(Authors::UpdateService).to receive(:new).
            with(id, action_params(author_params)).
            and_call_original
        end

        run_test!
      end

      response '404', 'author not found' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 404,
          errors: ['Resource not found']
        }

        let(:author_params) { { first_name: 'John', last_name: 'Snow' } }
        let(:id) { 'invalid' }

        before do
          expect(Authors::UpdateService).to receive(:new).
            with(id, action_params(author_params)).
            and_call_original
        end

        run_test! do |response|
          expect(body_json['errors']).to eq(['Resource not found'])
        end
      end
    end
  end
end

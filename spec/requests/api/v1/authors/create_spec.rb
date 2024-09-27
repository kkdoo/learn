require 'swagger_helper'

describe 'Authors API' do
  path '/v1/authors' do
    post 'Creates a author' do
      tags 'Authors'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :author, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string }
        },
        required: [ 'first_name', 'last_name' ]
      }

      request_body_example value: { first_name: 'Bob', last_name: 'Marley' },
        name: 'author_create', summary: 'Successful create'

      response '201', 'created a new author' do
        schema '$ref' => '#/components/schemas/author_entity'

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          first_name: 'Bob',
          last_name: 'Marley',
        }

        let(:author) { { first_name: 'Bob', last_name: 'Marley' } }

        before do
          expect(Authors::CreateService).to receive(:new).and_call_original
        end

        run_test!
      end

      request_body_example value: { first_name: 'Bob' },
        name: 'author_missing_params', summary: 'Validation error'

      response '400', 'invalid request' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 400,
          errors: {
            name: 'last_name',
            message: 'last_name is missing',
          }
        }

        let(:author) { { first_name: 'Bob' } }

        before do
          expect(Authors::CreateService).to_not receive(:new)
        end

        run_test!
      end
    end
  end
end

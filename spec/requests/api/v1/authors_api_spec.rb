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
        schema type: :object,
          properties: {
            id: { type: :string },
            first_name: { type: :string },
            last_name: { type: :string },
          },
          required: [ 'id', 'first_name', 'last_name' ]

        let(:author) { { first_name: 'Bob', last_name: 'Marley' } }

        run_test!
      end

      request_body_example value: { first_name: 'Bob' },
        name: 'author_missing_params', summary: 'Validation error'

      response '400', 'invalid request' do
        schema type: :object,
          properties: {
            error: { type: :string },
          },
          required: [ 'error' ]

        let(:author) { { first_name: 'Bob' } }

        run_test!
      end
    end
  end
end

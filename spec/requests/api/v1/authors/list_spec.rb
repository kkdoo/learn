require 'swagger_helper'

describe 'Authors API' do
  path '/v1/authors' do
    get 'Get authors list' do
      tags 'Authors'
      consumes 'application/json'
      produces 'application/json'

      request_body_example value: { },
        name: 'author_list', summary: 'Success error'

      response '200', 'list all authors' do
        schema type: 'array', items: { '$ref' => '#/components/schemas/author_entity' }

        example 'application/json', :example, [
          {
            id: SecureRandom.uuid,
            first_name: 'Bob',
            last_name: 'Marley',
          }
        ]

        let!(:author) { create(:author) }

        run_test!
      end
    end
  end
end

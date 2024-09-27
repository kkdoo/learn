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

        let!(:author) { create_list(:author, 2) }

        before do
          expect(Authors::ListService).to receive(:new).and_call_original
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.count).to eq(2)
        end
      end
    end
  end
end

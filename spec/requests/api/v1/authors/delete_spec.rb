require 'swagger_helper'

describe 'Authors API' do
  path '/v1/authors/{id}' do
    delete 'Delete an author' do
      tags 'Authors'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      request_body_example value: { },
        name: 'author_delete', summary: 'Successful delete'

      response '200', 'delete an author by id' do
        schema type: 'object',
          properties: {
            id: { type: 'string' }
          },
          required: [ 'id' ]

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          first_name: 'Bob',
          last_name: 'Marley',
        }

        let(:author) { create(:author) }
        let(:id) { author.id }

        before do
          expect(Authors::DeleteService).to receive(:new).with(id).
            and_call_original
        end

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

        let(:id) { 'invalid' }

        before do
          expect(Authors::DeleteService).to receive(:new).with(id).
            and_call_original
        end

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['errors']).to eq(['Resource not found'])
        end
      end
    end
  end
end

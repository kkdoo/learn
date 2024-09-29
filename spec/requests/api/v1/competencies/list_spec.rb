require 'swagger_helper'

describe 'Competencies API' do
  path '/v1/competencies' do
    get 'Get competencies list' do
      tags 'Competencies'
      consumes 'application/json'
      produces 'application/json'

      request_body_example value: {},
        name: 'competencies_list', summary: 'Success error'

      response '200', 'list all competencies' do
        schema type: 'array', items: { '$ref' => '#/components/schemas/competency_entity' }

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          name: 'rails',
        }

        let!(:competency) { create_list(:competency, 2) }

        run_test! do |response|
          expect(body_json.count).to eq(2)
        end
      end
    end
  end
end

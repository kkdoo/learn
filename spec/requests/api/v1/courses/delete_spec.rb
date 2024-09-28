require 'swagger_helper'

describe 'Courses API' do
  path '/v1/courses/{id}' do
    delete 'Delete a course' do
      tags 'Courses'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      request_body_example value: {},
        name: 'course_delete', summary: 'Successful delete'

      response '200', 'delete a course by id' do
        schema type: 'object',
          properties: {
            id: { type: 'string' },
          },
          required: ['id']

        example 'application/json', :example, {
          id: SecureRandom.uuid,
        }

        let(:course) { create(:course) }
        let(:id) { course.id }

        run_test!
      end

      response '404', 'course not found' do
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

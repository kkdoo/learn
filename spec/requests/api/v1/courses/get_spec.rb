require 'swagger_helper'

describe 'Courses API' do
  path '/v1/courses/{id}' do
    get 'Get a course by id' do
      tags 'Courses'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string

      request_body_example value: {},
        name: 'course_get', summary: 'Success error'

      response '200', 'find course by id' do
        schema '$ref' => '#/components/schemas/course_entity'

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          author_id: SecureRandom.uuid,
          name: 'Web course',
          description: 'Web course details',
        }

        let(:course) { create(:course) }
        let(:id) { course.id }

        run_test!
      end

      response '404', 'invalid request' do
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

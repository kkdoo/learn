require 'swagger_helper'

describe 'Courses API' do
  path '/v1/courses' do
    get 'Get courses list' do
      tags 'Courses'
      consumes 'application/json'
      produces 'application/json'

      request_body_example value: {},
        name: 'courses_list', summary: 'Success error'

      response '200', 'list all courses' do
        schema type: 'array', items: { '$ref' => '#/components/schemas/course_entity' }

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          author_id: SecureRandom.uuid,
          name: 'Web course',
          description: 'Web course details',
        }

        let!(:course) { create_list(:course, 2) }

        run_test! do |response|
          expect(body_json.count).to eq(2)
        end
      end
    end
  end
end

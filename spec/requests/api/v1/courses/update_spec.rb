require 'swagger_helper'

describe 'Courses API' do
  path '/v1/courses/{id}' do
    put 'Update a course' do
      tags 'Courses'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string
      parameter name: :course_params, in: :body, schema: {
        type: :object,
        properties: {
          author_id: { type: :string },
          name: { type: :string },
          description: { type: :string },
        },
      }

      request_body_example(
        value: {
          author_id: 'place-author-id-here',
          name: 'Web course',
          description: 'Web course details',
        },
        name: 'course_create', summary: 'Successful create'
      )

      response '200', 'update a course by id' do
        schema '$ref' => '#/components/schemas/course_entity'

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          author_id: SecureRandom.uuid,
          name: 'Web course',
          description: 'Web course details',
        }

        let(:author) { course.author }
        let(:course) { create(:course) }
        let(:course_params) { { name: 'Web 3.0' } }
        let(:id) { author.id }

        run_test!
      end

      response '404', 'course not found' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 404,
          errors: ['Resource not found'],
        }

        let(:course_params) { { name: 'Web 3.0' } }
        let(:id) { 'invalid' }

        run_test! do |response|
          expect(body_json['errors']).to eq(['Resource not found'])
        end
      end
    end
  end
end

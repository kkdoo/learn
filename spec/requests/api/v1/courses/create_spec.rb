require 'swagger_helper'

describe 'Courses API' do
  path '/v1/courses' do
    post 'Creates a course' do
      tags 'Courses'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :course_params, in: :body, schema: {
        type: :object,
        properties: {
          author_id: { type: :string },
          name: { type: :string },
          description: { type: :string },
        },
        required: %w(author_id name),
      }

      request_body_example value: { author_id: 'place-author-id-here', name: 'Web course' },
        name: 'course_create', summary: 'Successful create'

      response '201', 'created a new course' do
        schema '$ref' => '#/components/schemas/course_entity'

        example 'application/json', :example, {
          id: SecureRandom.uuid,
          name: 'Web course',
          description: 'Web course details',
        }

        let(:author) { create(:author) }
        let(:course_params) { { author_id: author.id, name: 'Web course' } }

        run_test!
      end

      request_body_example value: { name: 'Web course' },
        name: 'course_missing_params', summary: 'Validation error'

      response '400', 'invalid request' do
        schema '$ref' => '#/components/schemas/errors_resp'

        example 'application/json', :example, {
          status: 400,
          errors: {
            name: 'name',
            messages: ['is missing'],
          },
        }

        let(:course_params) { { name: 'Web course' } }

        run_test!
      end
    end
  end
end

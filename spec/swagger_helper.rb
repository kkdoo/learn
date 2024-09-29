# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1',
      },
      components: {
        schemas: {
          author_entity: {
            type: :object,
            properties: {
              id: { type: :string },
              first_name: { type: :string },
              last_name: { type: :string },
            },
            required: ['id', 'first_name', 'last_name'],
          },
          course_entity: {
            type: :object,
            properties: {
              id: { type: :string },
              author_id: { type: :string },
              name: { type: :string },
              description: { type: :string },
            },
            required: ['id', 'author_id', 'name'],
          },
          competency_entity: {
            type: :object,
            properties: {
              id: { type: :string },
              name: { type: :string },
            },
            required: ['id', 'name'],
          },
          error_message: {
            type: 'object',
            properties: {
              name: { type: 'string' },
              messages: { type: 'array', items: { type: 'string' } },
            },
            required: ['name', 'messages'],
          },
          errors_resp: {
            type: 'object',
            properties: {
              status: { type: 'integer' },
              errors: {
                oneOf: [
                  { type: 'array', items: { type: 'string' } },
                  { type: 'array', items: { '$ref' => '#/components/schemas/error_message' } },
                ],
              },
            },
            required: ['status', 'errors'],
          },
        },
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}/api',
          variables: {
            defaultHost: {
              default: 'localhost:3000',
            },
          },
        },
      ],
    },
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end

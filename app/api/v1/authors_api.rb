class V1::AuthorsApi < Grape::API
  version "v1", using: :path

  format :json
  prefix :api

  resource :authors do
    params do
      requires :first_name, type: String
      requires :last_name, type: String
    end
    post do
      permitted_params = declared_params.permit(:first_name, :last_name)

      @author = Author.create!(permitted_params)
      present @author, with: Entities::AuthorEntity
    end

    get ':id'

    get
  end
end

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
      @author = Authors::CreateService.new(declared_params).call
      present @author, with: Entities::AuthorEntity
    end

    get ':id' do
      @author = Authors::GetService.new(params[:id]).call
      present @author, with: Entities::AuthorEntity
    end

    params do
      optional :per_page, type: Integer
      optional :page, type: Integer
    end
    get do
      @authors = Authors::ListService.new(declared_params).call
      present @authors, with: Entities::AuthorEntity
    end

    delete ':id' do
      @author = Authors::DeleteService.new(params[:id]).call
      present @author.as_json(only: [:id]).as_json
    end

    params do
      optional :first_name, type: String
      optional :last_name, type: String
    end
    put ':id' do
      @author = Authors::UpdateService.new(params[:id], declared_params).call
      present @author, with: Entities::AuthorEntity
    end
  end
end

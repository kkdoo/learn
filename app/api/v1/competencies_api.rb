class V1::CompetenciesApi < Grape::API
  version "v1", using: :path

  format :json
  prefix :api

  resource :competencies do
    params do
      requires :name, type: String
    end
    post do
      @competency = Competencies::CreateService.new(declared_params).call
      present @competency, with: Entities::CompetencyEntity
    end

    get ':id' do
    end

    get do
    end

    delete ':id' do
    end

    put ':id' do
    end
  end
end

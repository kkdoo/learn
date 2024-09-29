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
      @competency = Competencies::GetService.new(params[:id]).call
      present @competency, with: Entities::CompetencyEntity
    end

    get do
    end

    delete ':id' do
      @competency = Competencies::DeleteService.new(params[:id]).call
      present @competency.as_json(only: [:id]).as_json
    end

    put ':id' do
    end
  end
end

class V1::CompetenciesApi < Grape::API
  version "v1", using: :path

  format :json
  prefix :api

  resource :competencies do
    post do
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

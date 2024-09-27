class V1::CoursesApi < Grape::API
  version "v1", using: :path

  format :json
  prefix :api

  resource :courses do
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

class V1::CoursesApi < Grape::API
  version "v1", using: :path

  format :json
  prefix :api

  resource :courses do
    params do
      requires :author_id, type: String
      requires :name, type: String
      requires :competencies, type: Array[String]
      optional :description, type: String
    end
    post do
      @course = Courses::CreateService.new(declared_params).call
      present @course, with: Entities::CourseEntity
    rescue Courses::CreateService::UnknownAuthor
      error!({ status: 400, errors: [{name: 'author_id', message: 'is invalid'}] }, 400)
    end

    get ':id' do
      @course = Courses::GetService.new(params[:id]).call
      present @course, with: Entities::CourseEntity
    end

    get do
      @courses = Courses::ListService.new(params).call
      present @courses, with: Entities::CourseEntity
    end

    delete ':id' do
      @course = Courses::DeleteService.new(params[:id]).call
      present @course.as_json(only: [:id]).as_json
    end

    params do
      optional :author_id, type: String
      optional :name, type: String
      optional :description, type: String
    end
    put ':id' do
      @course = Courses::UpdateService.new(params[:id], declared_params).call
      present @course, with: Entities::CourseEntity
    end
  end
end

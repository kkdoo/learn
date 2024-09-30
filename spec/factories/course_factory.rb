# == Schema Information
#
# Table name: courses
#
#  id          :uuid             not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :uuid             not null
#
FactoryBot.define do
  factory :course do
    name { 'Web course' }
    description { 'Some web course details' }
    author

    factory :course_with_competencies do
      after(:create) do |course|
        %w(ruby rails sidekiq).each do |name|
          competency = Competency.find_or_create_by(name:)
          course.competency_courses.create!(competency_id: competency.id)
        end
      end
    end
  end
end

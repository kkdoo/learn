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
  end
end

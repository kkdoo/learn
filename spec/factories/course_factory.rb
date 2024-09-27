# == Schema Information
#
# Table name: authors
#
#  id         :uuid             not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :course do
    name { 'Web course' }
    description { 'Some web course details' }
    author
  end
end

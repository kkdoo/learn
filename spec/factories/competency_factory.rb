# == Schema Information
#
# Table name: competencies
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :competency do
    name { 'rails' }
  end
end

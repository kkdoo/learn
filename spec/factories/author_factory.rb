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
  factory :author do
    first_name { 'Bob' }
    last_name { 'Marley' }
  end
end

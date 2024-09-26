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
class Author < ApplicationRecord
  has_many :courses
end

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
class Course < ApplicationRecord
  belongs_to :author
  has_many :competencies
end

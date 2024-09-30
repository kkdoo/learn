# == Schema Information
#
# Table name: competencies
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Competency < ApplicationRecord
  has_many :competency_courses, dependent: :destroy
  has_many :courses, through: :competency_courses

  validates :name, presence: true
end

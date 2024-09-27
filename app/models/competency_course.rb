# == Schema Information
#
# Table name: competency_courses
#
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competency_id :uuid             not null, primary key
#  course_id     :uuid             not null, primary key
#
class CompetencyCourse < ApplicationRecord
  self.primary_key = [:course_id, :competency_id]

  belongs_to :competency
  belongs_to :course
end

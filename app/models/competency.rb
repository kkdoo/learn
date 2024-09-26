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
  belongs_to :course
end

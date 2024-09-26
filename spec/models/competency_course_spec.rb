# == Schema Information
#
# Table name: competency_courses
#
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competency_id :uuid             not null, primary key
#  course_id     :uuid             not null, primary key
#
require 'rails_helper'

RSpec.describe CompetencyCourse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

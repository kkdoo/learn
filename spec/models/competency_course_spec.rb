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
  describe 'associations' do
    it { should belong_to(:competency) }
    it { should belong_to(:course) }
  end
end

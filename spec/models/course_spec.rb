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
require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:competency_courses).dependent(:destroy) }
    it { should have_many(:competencies).through(:competency_courses) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end

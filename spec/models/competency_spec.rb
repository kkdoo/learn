# == Schema Information
#
# Table name: competencies
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Competency, type: :model do
  describe 'associations' do
    it { should have_many(:competency_courses).dependent(:destroy) }
    it { should have_many(:courses).through(:competency_courses) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end

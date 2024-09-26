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
  pending "add some examples to (or delete) #{__FILE__}"
end

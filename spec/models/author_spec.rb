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
require 'rails_helper'

RSpec.describe Author, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

require 'rails_helper'

describe Authors::DeleteService do
  let(:service) { described_class.new(params) }

  context 'with valid id' do
    it 'will successfully delete record'
  end

  context 'with invalid id' do
    it 'will raise error'
  end
end

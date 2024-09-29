require 'rails_helper'

describe Authors::GetService do
  let(:service) { described_class.new(params) }

  context 'with valid id' do
    it 'will find record'
  end

  context 'with invalid id' do
    it 'will raise error'
  end
end

require 'rails_helper'

describe Authors::ListService do
  let(:service) { described_class.new(params) }

  context 'with records' do
    it 'return all records'
  end

  context 'without records' do
    it 'return empty array'
  end
end

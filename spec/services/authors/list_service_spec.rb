require 'rails_helper'

describe Authors::ListService do
  let(:service) { described_class.new }

  context 'with records' do
    before do
      create_list(:author, 3)
    end

    it 'return all records' do
      result = service.call
      expect(result.count).to eq(3)
    end
  end

  context 'without records' do
    it 'return empty array' do
      result = service.call
      expect(result.count).to eq(0)
    end
  end
end

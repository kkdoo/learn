require 'rails_helper'

RSpec.shared_examples 'list service' do
  context 'with records' do
    before do
      create_list(factory_name, 3)
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

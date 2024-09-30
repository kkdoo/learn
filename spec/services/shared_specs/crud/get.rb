require 'rails_helper'

RSpec.shared_examples 'get service' do
  context 'with valid id' do
    let(:id) { record.id }

    it 'will find record' do
      expect(service.call).to eq(record)
    end
  end

  context 'with invalid id' do
    let(:id) { 'wrong_id' }

    it 'will raise error' do
      expect {
        service.call
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

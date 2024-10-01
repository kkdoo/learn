require 'rails_helper'

RSpec.shared_examples 'delete service' do
  context 'with valid id' do
    let(:id) { valid_id }

    it 'will successfully delete record' do
      expect {
        service.call
      }.to change { model.count }.by(-1)
    end

    it 'return record in response' do
      expect(service.call).to eq(record)
    end
  end

  context 'with invalid id' do
    let(:id) { invalid_id }

    it 'will raise error and not delete records' do
      initial_count = model.count

      expect {
        service.call
      }.to raise_error(ActiveRecord::RecordNotFound)

      expect(model.count).to eq(initial_count)
    end
  end
end

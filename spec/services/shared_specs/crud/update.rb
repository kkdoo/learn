require 'rails_helper'

RSpec.shared_examples 'update service' do
  let(:service) { described_class.new(id, action_params(params)) }

  context 'with valid params' do
    let(:params) { valid_params }
    let(:id) { record.id }

    it 'find record and update attributes' do
      result = service.call

      expect(result.id).to eq(record.id)
      expect(result.as_json(except: [:created_at, :updated_at])).to eq(expected_attrs)
    end
  end

  context 'when id was invalid' do
    let(:params) { valid_params }
    let(:id) { 'wrong_id' }

    it 'failed' do
      expect do
        service.call
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'when params are invalid' do
    let(:params) { invalid_params }
    let(:id) { record.id }

    it 'failed' do
      expect do
        service.call
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

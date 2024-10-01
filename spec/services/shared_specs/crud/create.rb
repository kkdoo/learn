require 'rails_helper'

RSpec.shared_examples 'create service' do
  context 'with valid params' do
    let(:params) { valid_params }

    it 'success' do
      expect do
        service.call
      end.to change { model.count }.by(1)
    end

    it 'return competency in response' do
      expect(service.call).to be_kind_of(model)
    end
  end

  context 'with invalid params' do
    let(:params) { invalid_params }

    it 'failed' do
      expect do
        service.call
      end.to raise_error(ActiveRecord::RecordInvalid)

      expect(model.count).to eq(0)
    end
  end
end

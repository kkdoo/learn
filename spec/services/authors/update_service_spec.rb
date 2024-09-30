require 'rails_helper'

describe Authors::UpdateService do
  let(:service) { described_class.new(id, action_params(params)) }
  let!(:author) { create(:author) }
  let(:valid_params) { { first_name: 'John', last_name: 'Snow' } }

  context 'with valid params' do
    let(:params) { valid_params }
    let(:id) { author.id }

    it 'find record and update attributes' do
      result = service.call

      expect(result.id).to eq(author.id)
      expect(result.first_name).to eq('John')
      expect(result.last_name).to eq('Snow')
    end
  end

  context 'when id was invalid' do
    let(:params) { valid_params }
    let(:id) { 'wrong_id' }

    it 'failed' do
      expect {
        service.call
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'when params are invalid' do
    let(:params) { { first_name: '' } }
    let(:id) { author.id }

    it 'failed' do
      expect {
        service.call
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

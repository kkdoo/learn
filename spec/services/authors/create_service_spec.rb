require 'rails_helper'

describe Authors::CreateService do
  let(:service) { described_class.new(action_params(params)) }

  context 'with valid params' do
    let(:params) { { first_name: 'Bob', last_name: 'Marley' } }

    it 'success' do
      expect {
        service.call
      }.to change { Author.count }.by(1)
    end

    it 'return author in response' do
      expect(service.call).to be_kind_of(Author)
    end
  end

  context 'with invalid params' do
    let(:params) { { first_name: 'Bob' } }

    it 'failed' do
      expect {
        service.call
      }.to raise_error(ActiveRecord::RecordInvalid)

      expect(Author.count).to eq(0)
    end
  end
end

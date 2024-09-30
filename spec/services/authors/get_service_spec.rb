require 'rails_helper'

describe Authors::GetService do
  let(:service) { described_class.new(id) }
  let!(:author) { create(:author) }

  context 'with valid id' do
    let(:id) { author.id }

    it 'will find record' do
      expect(service.call).to eq(author)
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

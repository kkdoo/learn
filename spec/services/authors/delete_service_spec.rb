require 'rails_helper'

describe Authors::DeleteService do
  let(:service) { described_class.new(id) }
  let!(:author) { create(:author) }

  context 'with valid id' do
    let(:id) { author.id }

    it 'will successfully delete record' do
      expect {
        service.call
      }.to change { Author.count }.by(-1)
    end

    it 'return author in response' do
      expect(service.call).to eq(author)
    end
  end

  context 'with invalid id' do
    let(:id) { 'wrong_id' }

    it 'will raise error' do
      expect(Author.count).to eq(1)

      expect {
        service.call
      }.to raise_error(ActiveRecord::RecordNotFound)

      expect(Author.count).to eq(1)
    end
  end
end

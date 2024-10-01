require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/delete')

describe Authors::DeleteService do
  let(:service) { described_class.new(id) }
  let(:valid_id) { record.id }
  let(:invalid_id) { 'wrong_id' }
  let(:model) { Author }
  let!(:record) { create(:author) }

  context 'when we have more than two authors' do
    let!(:another_author) { create(:author, first_name: 'John') }

    it_behaves_like 'delete service'

    # TODO: will add these specs soon
    it 'author for all courses will be replaced with new author'
    it 'old author will be deleted'
  end

  context 'when delete last author' do
    # TODO: will add these specs soon
    it 'raised error LastAuthorUndeletable'
  end
end

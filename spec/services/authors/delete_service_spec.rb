require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/delete')

describe Authors::DeleteService do
  let(:service) { described_class.new(id) }
  let(:valid_id) { record.id }
  let(:invalid_id) { 'wrong_id' }
  let(:model) { Author }
  let!(:record) { create(:author) }

  it_behaves_like 'delete service'
end

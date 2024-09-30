require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/delete')

describe Competencies::DeleteService do
  let(:service) { described_class.new(id) }
  let(:valid_id) { record.id }
  let(:invalid_id) { 'wrong_id' }
  let(:model) { Competency }
  let!(:record) { create(:competency) }

  it_behaves_like 'delete service'
end

require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/get')

describe Competencies::GetService do
  let(:service) { described_class.new(id) }
  let(:valid_id) { record.id }
  let(:invalid_id) { 'wrong_id' }
  let!(:record) { create(:competency) }

  it_behaves_like 'get service'
end

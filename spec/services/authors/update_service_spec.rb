require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/update')

describe Authors::UpdateService do
  let(:service) { described_class.new(action_params(params)) }
  let(:valid_params) { { first_name: 'John', last_name: 'Snow' } }
  let(:invalid_params) { { first_name: 'John', last_name: '' } }
  let!(:record) { create(:author) }
  let(:expected_attrs) { { id: record.id, first_name: 'John', last_name: 'Snow' }.as_json }

  it_behaves_like 'update service'
end

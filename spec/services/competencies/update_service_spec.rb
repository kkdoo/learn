require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/update')

describe Competencies::UpdateService do
  let(:service) { described_class.new(action_params(params)) }
  let(:valid_params) { { name: 'django' } }
  let(:invalid_params) { { name: '' } }
  let!(:record) { create(:competency) }
  let(:expected_attrs) { { id: record.id, name: 'django' }.as_json }

  it_behaves_like 'update service'
end

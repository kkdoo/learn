require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/create')

describe Competencies::CreateService do
  let(:service) { described_class.new(action_params(params)) }
  let(:valid_params) { { name: 'rails' } }
  let(:invalid_params) { { name: '' } }
  let(:model) { Competency }

  it_behaves_like 'create service'
end

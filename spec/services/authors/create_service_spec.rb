require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/create')

describe Authors::CreateService do
  let(:service) { described_class.new(action_params(params)) }
  let(:valid_params) { { first_name: 'Bob', last_name: 'Marley' } }
  let(:invalid_params) { { first_name: 'Bob' } }
  let(:model) { Author }

  it_behaves_like 'create service'
end

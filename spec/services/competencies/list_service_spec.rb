require 'rails_helper'
require Rails.root.join('spec/services/shared_specs/crud/list')

describe Competencies::ListService do
  let(:service) { described_class.new(params) }
  let(:params) { {} }
  let(:factory_name) { :competency }

  it_behaves_like 'list service'
end

require 'rails_helper'

describe Authors::CreateService do
  let(:service) { described_class.new(params) }

  context 'with valid params' do
    it 'success'
  end

  context 'with invalid params' do
    it 'failed'
  end
end

require 'rails_helper'

describe Authors::UpdateService do
  let(:service) { described_class.new(params) }

  context 'with valid params' do
    it 'find record and update attributes'
  end

  context 'when id was invalid' do
    it 'failed'
  end

  context 'when params are invalid' do
    it 'failed'
  end
end

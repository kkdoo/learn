require 'rails_helper'

RSpec.describe DeleteAuthorJob, type: :job do
  context 'on call' do
    let(:job) { described_class.new }
    let(:id) { 'some-service-id' }
    let(:service) { double('service') }

    it 'run delete author service' do
      expect(service).to receive(:call)
      expect(Authors::DeleteService).to receive(:new).with(id).
        and_return(service)

      job.perform(id)
    end
  end
end

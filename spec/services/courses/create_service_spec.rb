require 'rails_helper'

describe Courses::CreateService do
  let(:service) { described_class.new(action_params(params)) }
  let(:author) { create(:author) }
  let(:model) { Course }
  let(:valid_params) do
    {
      author_id: author.id,
      name: 'Web course',
      description: 'Web course details',
      competencies: %w(ruby rails sidekiq),
    }
  end

  context 'with valid params' do
    let(:params) { valid_params }

    it 'create course with author and competencies' do
      result = nil
      expect {
        result = service.call
      }.to change { Course.count }.by(1)

      expect(result.author_id).to eq(author.id)
      expect(result.name).to eq('Web course')
      expect(result.description).to eq('Web course details')
      expect(result.competencies.pluck(:name)).to eq(%w(ruby rails sidekiq))
    end
  end
end

require 'rails_helper'

describe Courses::CreateService do
  let(:service) { described_class.new(action_params(params)) }
  let(:author) { create(:author) }
  let(:model) { Course }
  let(:competencies_list) { %w(ruby rails sidekiq) }
  let(:valid_params) do
    {
      author_id: author.id,
      name: 'Web course',
      description: 'Web course details',
      competencies: competencies_list,
    }
  end

  context 'with valid params' do
    let(:params) { valid_params }

    shared_examples 'create course and competencies' do
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

      it 'create new competencies and assign them to course' do
        expect {
          service.call
        }.to change { Competency.count }.by(competentions_created_times)
      end
    end

    context 'without competencies at all' do
      let(:competentions_created_times) { 3 }

      it_behaves_like 'create course and competencies'
    end

    context 'when some competencies already created' do
      before do
        Competency.create!(name: 'ruby')
      end

      let(:competentions_created_times) { 2 }

      it_behaves_like 'create course and competencies'
    end
  end
end

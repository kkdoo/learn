require 'rails_helper'

describe Courses::UpdateService do
  let(:service) { described_class.new(id, action_params(params)) }
  let!(:course) { create(:course_with_competencies) }
  let(:competencies) { (new_competencies + existing_competencies).sort }

  context 'with valid params' do
    context 'when passed new and existing competencies' do
      let(:new_competencies) { %w(python django) }
      let(:existing_competencies) { %w(ruby rails sidekiq) }
      let(:params) { { competencies: } }
      let(:id) { course.id }

      it 'updates competencies' do
        result = nil
        expect {
          result = service.call
        }.to change { Competency.count }.by(2)

        expect(result.competencies.pluck(:name).sort).to eq(competencies)
      end
    end

    context 'when passed new, existing and removed competencies' do
      let(:new_competencies) { %w(python django) }
      let(:existing_competencies) { %w(rails) }
      let(:params) { { competencies: } }
      let(:id) { course.id }

      it 'updates competencies' do
        result = nil
        expect {
          result = service.call
        }.to change { Competency.count }.by(2)

        expect(result.competencies.pluck(:name).sort).to eq(competencies)
      end
    end

    context 'when passed all new competencies'
    context 'when passed all existing competencies'
  end
end

require 'rails_helper'

RSpec.describe QuizItem, type: :model do
  context 'associations' do
    it { should belong_to(:quiz).class_name('Quiz') }
  end

  describe 'quiz attributes' do
    let(:quiz) { create(:quiz) }
    let!(:quiz_item) { create(:quiz_item, quiz_id: quiz.id) }

    specify do
      q = QuizItem.find_by(id: quiz_item.id)
      expect(
        q.serializable_hash.keys
      ).to eq(
        %w[
          id
          quiz_id
          distractor
          created_at
          updated_at
        ]
      )
    end
  end
end

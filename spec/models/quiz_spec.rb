require 'rails_helper'

RSpec.describe Quiz, type: :model do
  context 'associations' do
    it { should have_many(:quiz_items).class_name('QuizItem') }
  end

  describe 'quiz attributes' do
    let!(:quiz) { create(:quiz) }

    specify do
      q = Quiz.find_by(id: quiz.id)
      expect(
        q.serializable_hash.keys
      ).to eq(
        %w[
          id
          question
          answer
          created_at
          updated_at
        ]
      )
    end
  end
end

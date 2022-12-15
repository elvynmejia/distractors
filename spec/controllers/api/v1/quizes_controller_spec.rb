require 'rails_helper'

RSpec.describe Api::V1::QuizesController do
  describe "index" do
    let!(:quizes) { create_list(:quiz, 5) }

    specify do
      post(
        :index
      )
      expect(response.status).to eq(200)
      expect(parsed_body[:quizes].length).to eq(5)
    end
  end

  describe "post" do
    xspecify "creates quiz" do
      post(
        :create,
        params: {
          question:  "Mars is a _____ in our solar system." ,
          answer: "planet"
        }
      )

      expect(response.status).to eq(201)

      quiz = Quiz.last
      expect(quiz.answer).to eq("planet")

      quiz_items = QuizItem.where(
        quiz_id: quiz.id
      )

      expect(parsed_body[:quiz].keys).to eq(["id", "question", "answer", "created_at", "updated_at"])

      expect(quiz_items.length).to eq(10)
      expect(quiz_items[0].quiz_id).to eq(quiz.id)
      expect(quiz_items[0].distractor).to be_a(String)
    end
  end

  describe "show" do
    specify do
      quiz = Quiz.create!(
        question: "hi",
        answer: "hello"
      )

      quiz_item = QuizItem.create!(
        quiz_id: quiz.id,
        distractor: "some distractor"
      )

      get(:show, params: { id: quiz.id })
      expect(response.status).to eq(200)

      expect(parsed_body[:quiz][:id]).to eq(quiz.id)
      expect(parsed_body[:quiz].keys).to eq(["id", "question", "answer", "created_at", "updated_at", "quiz_items"])

      expect(parsed_body[:quiz][:quiz_items].length).to eq(1)
      expect(parsed_body[:quiz][:quiz_items][0].keys).to eq(["id", "distractor", "created_at", "updated_at"])
      expect(parsed_body[:quiz][:quiz_items][0][:id]).to eq(quiz_item.id)
      expect(parsed_body[:quiz][:quiz_items][0][:distractor]).to eq(quiz_item.distractor)
    end
  end
end

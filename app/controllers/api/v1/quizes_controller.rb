class Api::V1::QuizesController < ApplicationController
  def index
    quizes = Quiz.all
    render(
      json: {
        quizes: quizes.map { |quiz| QuizesPresenter.new(quiz).present }
      },
      status: 200
    )
  end

  def create
    quiz = Quiz.create!(
      question: params[:question],
      answer: params[:answer]
    )

    # distractors = Services::Apis::Cerego.get_suggested_distractors(
    #   question: quiz.question,
    #   answer: quiz.answer
    # )
    #
    # distractors.each do |item|
    #   QuizItem.create!(
    #     quiz_id: quiz.id,
    #     distractor: item[:text]
    #   )
    # end

    render(
      json: {
        quiz: QuizesPresenter.new(quiz).present
      },
      status: 201
    )
  end

  def show
    quiz = Quiz.find_by!(id: params[:id])

    render(
      json: {
        quiz: QuizesPresenter.new(quiz).present.merge({
            quiz_items: quiz.quiz_items.map { |item| QuizItemsPresenter.new(item).present }
        })
      },
      status: 200
    )
  end
end

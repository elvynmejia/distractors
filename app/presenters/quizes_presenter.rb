class QuizesPresenter
  def initialize(quiz)
    @quiz ||= quiz
  end

  def present(options = {})
    @present ||= {
      id: @quiz.id,
      question: @quiz.question,
      answer: @quiz.answer,
      created_at: @quiz.created_at,
      updated_at: @quiz.updated_at
    }
  end
end

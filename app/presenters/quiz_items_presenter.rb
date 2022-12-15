class QuizItemsPresenter
  def initialize(quiz_item)
    @quiz_item ||= quiz_item
  end

  def present(options = {})
    @present ||= {
      id: @quiz_item.id,
      distractor: @quiz_item.distractor,
      created_at: @quiz_item.created_at,
      updated_at: @quiz_item.updated_at
    }
  end
end

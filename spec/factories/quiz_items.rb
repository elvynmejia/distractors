FactoryBot.define do
  factory :quiz_item do
    quiz_id { 1 }
    distractor { "MyString" }
  end
end

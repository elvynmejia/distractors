class CreateQuizItems < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_items do |t|
      t.integer :quiz_id
      t.string :distractor

      t.timestamps
    end
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :feedback
      t.integer :vote
      t.boolean :is_active,    default: true
      t.timestamps
    end
    add_index(:answers, [:question_id, :user_id])
  end
end

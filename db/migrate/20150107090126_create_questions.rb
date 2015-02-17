class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :title
      t.text :description
      t.boolean :is_active,    default: true
      t.integer :view_count,   limit: 8, default: 0
      t.timestamps 
    end
    add_index(:questions, :user_id)
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.integer :user_id
      t.integer :target_id
    end
  end
end

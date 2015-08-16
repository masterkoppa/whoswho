class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :email
      t.string :full_name
      t.string :nickname
      t.string :url
      t.references :company
    end
  end
end

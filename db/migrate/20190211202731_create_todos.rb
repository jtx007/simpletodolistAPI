class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :todoname
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end

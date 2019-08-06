class CreateTodoListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_list_items do |t|
      t.string :name
      t.boolean :is_done
      t.datetime :due_date

      t.timestamps
    end
  end
end

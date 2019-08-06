class TodoListItemBelongsToTodoList < ActiveRecord::Migration[5.2]
  def change
    add_reference :todo_list_items, :todo_list, index: true
  end
end

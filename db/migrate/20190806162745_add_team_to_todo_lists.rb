class AddTeamToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_reference :todo_lists, :team, foreign_key: true
  end
end

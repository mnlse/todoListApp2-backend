# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |x|
  team = Team.create!(name: "team #{x}")

  10.times do |y|
    todo_list = TodoList.create!(team: team, name: "todolist #{y}")
    
    3.times do |z|
      todo_list_item = TodoListItem.create!(todo_list: todo_list, name: "Groceries #{z}")
    end
  end
end


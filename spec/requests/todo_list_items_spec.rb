require 'rails_helper'

# RSpec.describe "Todo List Items spec" do
#   
#   let(:team) do
#     Team.create!(name: "Team1")
#   end
# 
#   let(:todo_list) do
#     TodoList.create!(name: "Test", team: team)
#   end
# 
#   let(:todo_list_item) do
#     TodoListItem.create!(name: "QWERTY", todo_list: todo_list, due_date: Date.today, is_done: false)
#   end
#   let(:todo_list_item_2) do
#     TodoListItem.create!(name: "asdf", todo_list: todo_list, due_date: Date.today, is_done: false)
#   end
# 
#   it "lists all todo list items" do
#     todo_list_item
#     todo_list_item_2
# 
#     get("/todo_lists/#{todo_list.id}/todo_list_items")
#     expect(response.status).to eq 200
#     json = JSON.parse(response.body)
# 
#     expect(json[0]).to have_key "name"
#     expect(json[0]["name"]).to eq todo_list_item.name
#     expect(json[0]["due_date"]).to eq JSON.parse(todo_list_item.due_date.to_json)
#     expect(json[0]["is_done"]).to eq todo_list_item.is_done
# 
#     expect(json[1]).to have_key "name"
#     expect(json[1]["name"]).to eq todo_list_item_2.name
#     expect(json[1]["due_date"]).to eq JSON.parse(todo_list_item_2.due_date.to_json)
#     expect(json[1]["is_done"]).to eq todo_list_item_2.is_done
#   end
# 
#   it "shows a todo list item" do 
#     todo_list_item
# 
#     get(team_todo_list_todo_list_item_path(todo_list, todo_list_item))
# 
#     expect(response.status).to eq 200
# 
#     json = JSON.parse(response.body)
#     expect(json).to eq JSON.parse(todo_list_item.to_json)
#   end
# 
#   it "deletes a todo list item" do
#     todo_list_item
#     
#     delete(team_todo_list_todo_list_item_path(todo_list, todo_list_item))
#     expect(response.status).to eq 200
# 
#   end
# 
#   it "edits a todo list item" do
#     new_name = 'asdsdasdsa'
#     todo_list
#     todo_list_item
# 
#     patch(team_todo_list_todo_list_item_path(todo_list, todo_list_item), params: { todo_list_item: { name: new_name } })
#     expect(response.status).to eq 200
#     get(todo_list_todo_list_item_path(todo_list, todo_list_item))
# 
#     json = JSON.parse(response.body)
# 
#     expect(json["name"]).to eq new_name
#   end
# 
#   it "creates a new todo list item" do
#     name = "123"
#     is_done = false
#     due_date = Date.today
# 
#     post(team_todo_list_todo_list_items_path(todo_list), params: { todo_list_item: { name: name, is_done: is_done, due_date: due_date } })
# 
#     expect(response.status).to eq 200
#   end
# end

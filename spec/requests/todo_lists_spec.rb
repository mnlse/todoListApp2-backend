require 'rails_helper'

RSpec.describe "Todo lists requests" do
  let(:team) { Team.create!(name: "asdf") }
  let(:todo_list) { TodoList.create!(team: team, name: "Groceries") }
  let(:todo_list_2) { TodoList.create!(team: team, name: "Test") }

  it "returns an empty hash of todo lists" do
    get(team_todo_lists_path(team))
    json = JSON.parse(response.body)
    expect(json).to eq([])
  end

  it "returns an array of todo lists" do
    todo_list
    todo_list_2

    get(team_todo_list_path(team))
    json = JSON.parse(response.body)
    expect(json[0]["name"]).to eq "Groceries"
    expect(json[1]["name"]).to eq "Testing"
  end

  it "deletes a todo list" do
    todolist = TodoList.create!(name: "Deletedlist", team: team)
    delete("/todo_lists/#{todolist.id}")
    expect(response.status).to eq 200
  end

  it "gets todo list" do
    todolist = TodoList.create!(name: "TodoList", team: team)
    get("/todo_lists/#{todolist.id}")
    expect(response.status).to eq 200
    json = JSON.parse(response.body)
    expect(json).to have_key "name"
    expect(json["name"]).to eq "TodoList"
  end

  it "throws a 404 not found when the ID is wrong" do
    todolist = TodoList.create!(name: "Deletedlist", team: team)
    get("/todo_lists/#{todolist.id}123")
    expect(response.status).to eq 404
  end

  it "creates a new todo list" do
    post('/todo_lists', params: { todo_list: { name: "Test" } } )
    expect(response.status).to eq 201
    get('/todo_lists')
    expect(response.status).to eq 200
    json = JSON.parse(response.body)
    expect(json[0]).to have_key "name"
    expect(json[0]["name"]).to eq "Test"
  end

  it "doesn't create an empty todo list" do
    post('/todo_lists', params: { todo_list: { name: "" } } )
    expect(response.status).to eq 422
  end
end

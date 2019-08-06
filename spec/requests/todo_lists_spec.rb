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

    get(team_todo_lists_path(team))
    json = JSON.parse(response.body)
    expect(json[0]["name"]).to eq "Groceries"
    expect(json[1]["name"]).to eq "Test"
  end

  it "deletes a todo list" do
    delete(team_todo_list_path(team, todo_list))
    expect(response.status).to eq 200
  end

  it "gets todo list" do
    get(team_todo_list_path(team, todo_list))
    expect(response.status).to eq 200
    json = JSON.parse(response.body)
    expect(json).to have_key "name"
    expect(json["name"]).to eq "Groceries"
  end

  it "throws a 404 not found when the ID is wrong" do
    todo_list
    get(team_todo_list_path(team, todo_list.id + 222))
    expect(response.status).to eq 404
  end

  it "creates a new todo list" do
    post(team_todo_lists_path(team), params: { todo_list: { name: "Test", team: team } } )
    expect(response.status).to eq 201
    get(team_todo_lists_path(team))
    expect(response.status).to eq 200
    json = JSON.parse(response.body)
    expect(json[0]).to have_key "name"
    expect(json[0]["name"]).to eq "Test"
  end

  it "doesn't create an empty todo list" do
    post(team_todo_lists_path(team), params: { todo_list: { name: "", team: team } } )
    expect(response.status).to eq 500
  end
end

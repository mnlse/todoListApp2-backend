require 'rails_helper'

RSpec.describe "Team requests" do
  let(:team) { Team.create!(name: "asdf") }
  let(:todo_list) { TodoList.create(team: team, name: "qwerty") }
  let(:todo_list_item) { TodoListItem.create(todo_list: todo_list, name: "Buy groceries") }
  let(:todo_list_item_2) { TodoListItem.create(todo_list: todo_list, name: "Buy vodka") }

  it "creates a new team" do
    name = 'asdf'

    post(teams_path, params: { team: { name: name } })

    expect(response.status).to eq 201
  end

  it "doesn't create a team with an empty name" do
    name = ""
    post(teams_path, params: { team: { name: name } })

    expect(response.status).to eq 500
  end

  it "lists all todolists and todolist items on the show page" do
    todo_list
    todo_list_item
    todo_list_item_2

    get(team_path(team))

    json = JSON.parse(response.body)
    expect(json["team"]).to have_key 'id'
    expect(json["team"]).to have_key 'name'
    expect(json["team"]["todo_lists"][0]).to have_key 'id'
    expect(json["team"]["todo_lists"][0]).to have_key 'name'
    expect(json["team"]["todo_lists"][0]["todo_list_items"][0]).to have_key 'id'
    expect(json["team"]["todo_lists"][0]["todo_list_items"][0]).to have_key 'name'
    expect(json["team"]["todo_lists"][0]["todo_list_items"][1]).to have_key 'id'
  end

  it "destroys a team" do
    delete(team_path(team))
    expect(response.status).to eq 200
  end

  it "edits a team's name" do
    name = "qwerty"

    patch(team_path(team), params: { team: { name: name } } )
    expect(response.status).to eq 200
    updated_team = Team.find(team.id)
    expect(updated_team.name).to eq name
  end
end

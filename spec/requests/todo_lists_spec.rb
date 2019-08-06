require 'rails_helper'

RSpec.describe "Todo lists requests" do
  describe "GET /todo_lists" do
    it "returns an empty hash of todo lists" do
      get('/todo_lists')
      json = JSON.parse(response.body)
      expect(json).to eq([])
    end

    it "returns an array of todo lists" do
      todolist = TodoList.create!(name: "Groceries")
      todolist2 = TodoList.create!(name: "Testing")

      get('/todo_lists')
      json = JSON.parse(response.body)
      expect(json[0]["name"]).to eq "Groceries"
      expect(json[1]["name"]).to eq "Testing"
    end
  end

  describe "DELETE /todo_lists/:id" do
    it "deletes a todo list" do
      todolist = TodoList.create!(name: "Deletedlist")
      delete("/todo_lists/#{todolist.id}")
      expect(response.status).to eq 200
    end
  end

  describe "GET /todo_lists/:id" do

    it "gets todo list" do
      todolist = TodoList.create!(name: "TodoList")
      get("/todo_lists/#{todolist.id}")
      expect(response.status).to eq 200
      json = JSON.parse(response.body)
      expect(json).to have_key "name"
      expect(json["name"]).to eq "TodoList"
    end

    it "throws a 404 not found when the ID is wrong" do
      todolist = TodoList.create!(name: "Deletedlist")
      get("/todo_lists/#{todolist.id}123")
      expect(response.status).to eq 404
    end
  end

  describe "POST /todo_lists" do

    it "creates a new todo list" do
      post('/todo_lists', params: { todo_list: { name: "Test" } } )
      expect(response.status).to eq 200
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

end

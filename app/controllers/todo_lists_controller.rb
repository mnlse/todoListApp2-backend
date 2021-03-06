class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :destroy, :update]

  def show
    render json: @todo_list, status: 200
  end

  def index
    @todo_lists = Team.find(params[:team_id]).todo_lists
    render json: @todo_lists, status: 200
  end

  def destroy
    if @todo_list.destroy
      render status: 200
    else
      render status: 422
    end
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.team = Team.find(params[:team_id])

    if @todo_list.save
      render json: @todo_list, status: 201
    else
      render status: 500
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      render status: 200
    else
      render status: 400
    end
  end

  private
  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:name)
  end
end

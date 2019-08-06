class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :destroy, :update]

  def show
    render json: @todo_list, status: 200
  end

  def index
    render json: TodoList.all, status: 200
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
    if @todo_list.save
      render status: 201
    else
      render status: 422
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

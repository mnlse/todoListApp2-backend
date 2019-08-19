class TodoListItemsController < ApplicationController
  before_action :set_todo_list_item, only: [:show, :destroy, :update]

  def index
    @todo_list_items = TodoListItem.all
    render json: @todo_list_items, status: 200
  end

  def show
    render json: @todo_list_item, status: 200
  end

  def destroy
    if @todo_list_item.destroy
      render status: 200
    else
      render status: 500
    end
  end

  def update
    if @todo_list_item.update(todo_list_item_params)
      render status: 200
    else
      render status: 500
    end
  end

  def create
    @todo_list_item = TodoListItem.new(todo_list_item_params)
    @todo_list_item.todo_list = TodoList.find(params[:todo_list_id])

    if @todo_list_item.save!
      render json: @todo_list_item, status: 201
    else
      render status: 500
    end
  end

  private
  def set_todo_list_item
    @todo_list_item = TodoListItem.find(params[:id])
  end

  def todo_list_item_params
    params.require(:todo_list_item).permit(:name, :due_date, :is_done, :todo_list_id)
  end
end

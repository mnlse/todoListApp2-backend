class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :destroy, :update]

  def index
    render json: Team.all.as_json, status: 200
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      render json: @team, status: 201
    else
      render status: 500
    end
  end

  def show
    @todo_lists = []
    @team.todo_lists.each do |todo_list|
      temp = JSON.parse(todo_list.to_json)
      temp["todo_list_items"] = todo_list.todo_list_items

      @todo_lists << temp
    end

    render json: {
      team: @team.attributes.merge({ todo_lists: @todo_lists }),
    }, status: 200
  end

  def destroy
    if @team.destroy
      render status: 200
    else
      render status: 500
    end
  end

  def update
    if @team.update(team_params)
      render status: 200
    else
      render status: 500
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
  
  def set_team
    @team = Team.find(params[:id])
  end
end

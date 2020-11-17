class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tools = policy_scope(Tool).order(created_at: :desc)
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    authorize @tool
    if @tool.save
      redirect_to @tool, notice: "Tool was successfully added"
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :category, :description, :user_id)
  end
end

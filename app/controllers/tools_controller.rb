class ToolsController < ApplicationController

  def index
    @tools = policy_scope(Tool).order(created_at: :desc)
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    authorize @tool
    if @tool.save
      redirect_to @tool, notice: "Tool was successfully added"
    else
      render :new
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :category, :description)
  end
end

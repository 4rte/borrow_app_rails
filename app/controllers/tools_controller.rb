class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tools = policy_scope(Tool).order(created_at: :desc)
     # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @tools.geocoded.map do |tool|
     {
      lat: tool.latitude,
      lng: tool.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { tool: tool })
     }
    end
  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
    @marker = [{lat: @tool.latitude,
                lng: @tool.longitude}
              ]
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

  def destroy
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool.destroy
    redirect_to user_path(current_user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :category, :description, :user_id, :address, :photo)
  end
end

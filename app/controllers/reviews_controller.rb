class ReviewsController < ApplicationController
  def new
    @tool = Tool.find(params[:tool_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @tool = Tool.find(params[:tool_id])
    @review.tool = @tool
    if @review.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

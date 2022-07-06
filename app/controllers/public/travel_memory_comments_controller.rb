class Public::TravelMemoryCommentsController < ApplicationController
  def create
    travel_memory = TravelMemory.find(params[:travel_memory_id])
    comment = current_customer.travel_memory_comments.new(travel_memory_comment_params)
    comment.travel_memory_id = travel_memory.id
    comment.save
    redirect_to travel_memory_path(travel_memory)
  end

  def destroy
    TravelMemoryComment.find(params[:id]).destroy
    redirect_to travel_memory_path(params[:travel_memory_id])
  end

  private
  def travel_memory_comment_params
    params.require(:travel_memory_comment).permit(:comment)
  end
end

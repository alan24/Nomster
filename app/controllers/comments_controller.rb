class CommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(:user => current_user))
    redirect_to places_path(@place)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end
    @comment.destroy
    redirect_to places_path(@place)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end

class CommentsController < ApplicationController
    def create
     comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{comment.tweet.id}"
    end
    
    def destroy
        comment = Comment.find(params[:id])
      if comment.user_id == current_user.id
        comment.destroy 
      end
      
    end
    def edit
        @comments = Comment.find(params[:id])
    end
    def update
        @comment = Comment.find(params[:id])
        if @comment.user_id == current_user.id
          @comment.update
        end
    end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end
end

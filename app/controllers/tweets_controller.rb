class TweetsController < ApplicationController

    def index
          @tweets = Tweet.order("created_at DESC").page(params[:page]).per(10)
    end
    
    def new
    end
    
    def create
        Tweet.create( text: tweet_params[:text], user_id: current_user.id)
    end
    def show
        
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    end
    def edit
        @tweet = Tweet.find(params[:id])
    end
     
    def destroy
    tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy 
      end
    end
    
    def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
    end
    def search
    @tweet = Tweet.where('text LIKE(?)', "%#{params[:search]}%").order("created_at DESC").page(params[:page]).per(10)
    end

    private
    def  tweet_params
        params.permit(:text)
    end
    
    
    
     def move_to_index
         redirect_to action: :index unless user_signed_in?
     end
     
end
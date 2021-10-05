class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end
  def index

  end
  def destroy
    friend = User.find(params[:id])
    user_friends = Friendship.where(user_id: current_user.id, stock_id: stock.id).first
    user_friends.destroy
    flash[:notice] = "You are no longer friend with #{friend.name}"
    redirect_to my_portfolio_path
  end

  def search
    
    if params[:friend].present?
      @friend = params[:friend]
      # render json: stock
      if @friend
        respond_to do |format|
          format.js {render partial: 'friends/results'}
        end
        # render 'users/my_portfolio'
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valide symbol to search"
          format.js {render partial: 'friends/results'}
        end
        # redirect_to my_portfolio_path
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js {render partial: 'friends/results'}
      end
    end
  end
  
end

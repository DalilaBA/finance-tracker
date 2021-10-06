class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
    @current_friends = current_user.friends
  end
  def index

  end
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
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
      @friends = User.search_param(params[:friend]).without(current_user)
      if @friends
        respond_to do |format|
          format.js {render partial: 'friends/results'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js {render partial: 'friends/results'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email to search"
        format.js {render partial: 'friends/results'}
      end
    end
  end
  
end

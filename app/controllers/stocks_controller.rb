class StocksController < ApplicationController
  
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      # render json: stock
      if @stock
        respond_to do |format|
          format.js {render partial: 'users/results'}
        end
        # render 'users/my_portfolio'
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valide symbol to search"
          format.js {render partial: 'users/results'}
        end
        # redirect_to my_portfolio_path
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js {render partial: 'users/results'}
      end
    end
  end
end

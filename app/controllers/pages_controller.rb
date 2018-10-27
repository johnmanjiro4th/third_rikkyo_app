class PagesController < ApplicationController
  include ApplicationHelper
  def index
    @items = Item.where(sold: false).paginate(page: params[:page]).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @items = @user.item.paginate(page: params[:page])
  end
end

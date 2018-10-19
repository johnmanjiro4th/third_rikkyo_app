class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @item = current_user.item.build if logged_in?
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find_by(id: @item.user_id)
    @comment = Comment.new
    @transaction = ItemTransaction.new
  end

  def create
    @item = current_user.item.build(item_params)
    if @item.save
      flash[:success]="出品に成功しました！"
      redirect_to root_url
    else
      flash[:success]="正しく入力されていません"
      render item_new_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    @user = @item.user
    if current_user == @user
      @item.update(item_params)
      @item.save
      redirect_to item_show_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "出品を取り消しました"
    redirect_to request.referrer || root_url
  end

  private

  def item_params
   params.require(:item).permit(:name, :content, :image, :price)
  end

  def correct_user
   @item = current_user.item.find_by(id: params[:id])
   redirect_to root_url if @item.nil?
  end
end

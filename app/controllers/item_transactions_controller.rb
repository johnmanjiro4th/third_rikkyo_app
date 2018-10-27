class ItemTransactionsController < ApplicationController

  def create
    @transaction = ItemTransaction.new(transaction_params)
    @item = Item.find(@transaction.item_id)
    if @transaction.save!
      @item.update_attribute(:sold, true)
      @item.save!
      redirect_to transaction_show_path(@transaction.id)
    else
      render root_url
    end
  end

  def show
    @transaction = ItemTransaction.find(params[:id])
    @item_transaction_comment = ItemTransactionComment.new
  end

  def index
    @user = User.find(params[:id])
    @buy_transactions = ItemTransaction.where(buyer_id: @user.id)
    @sell_transactions = ItemTransaction.where(seller_id: @user.id)
  end

  private

  def transaction_params
    params.require(:item_transaction).permit(:item_id, :seller_id, :buyer_id)
  end

end

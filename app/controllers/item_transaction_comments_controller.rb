class ItemTransactionCommentsController < ApplicationController
  def create
    @transaction = ItemTransaction.find(params[:id])
    @transaction_comment = @transaction.item_transaction_comment.build(transaction_comment_params)
    @transaction_comment.user = current_user
    if @transaction_comment.save
      redirect_to transaction_show_path(@transaction.id)
    else
      redirect_to transaction_show_path(@transaction.id)
    end

  end

  def destroy
    @transaction_comment = ItemTransactionComment.find(params[:id])
    @transaction_comment.destroy
     redirect_to  request.referrer || root_url
  end

  private

  def transaction_comment_params
    params.require(:item_transaction_comment).permit(:body)
  end
end

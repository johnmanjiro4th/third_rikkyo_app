class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comment.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to item_show_path(@item)
    else
      redirect_to item_show_path(@item)
    end

  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
     redirect_to  request.referrer || root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

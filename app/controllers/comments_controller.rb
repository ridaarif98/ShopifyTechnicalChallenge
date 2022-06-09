class CommentsController < ApplicationController
    def create
        @item = Item.find(params[:item_id])
        @comment = @item.comments.create(comment_parameters)
        flash[:notice] = 'Comment added successfully! '
        redirect_back(fallback_location: root_path)
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to deleted_comments_path(@comment.item_id)
      
    end

    def dell_comment
      @comment = Comment.find(params[:id])
      if @comment.dell==false
        @comment.update(dell: true)
        redirect_to show_path(@comment.item_id)
      else
        @comment.update(dell: false)
        redirect_to deleted_comments_path(@comment.item_id)
      end
    end

    def deleted_comments
      @comments = Comment.where(item_id: params[:item_id], dell: true)
    end
    private

    def comment_parameters
      params.require(:comment).permit(:text)
    end
end

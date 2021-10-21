class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :edit, :update]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id= current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: "Couldn't post ..." }
      end
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Editing comment'
      format.js { render :edit }
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'The comment has been edited'
          format.js { render :index }
        else
          flash.now[:notice] = 'Failed to edit comment'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'The comment has been deleted'
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :content, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

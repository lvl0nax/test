class CommentsController < ApplicationController
  before_action :set_article, :authenticate_user!
  before_action :set_comment, :can_comment_be_edited?, only: [:destroy, :update, :edit]

  def new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.article = @article

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_url(@article), notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @comment.update(comment_params)
    redirect_to article_url(@article), notice: 'Comment was successfully updated.'
  end

  def destroy
    @comment.destroy
    redirect_to article_url(@article), notice: 'Comment was successfully destroyed.'
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def can_comment_be_edited?
    redirect_to article_url(@article) unless can_be_edited?(@comment)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

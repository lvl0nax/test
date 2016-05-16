class MyArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = ArticleRelationBuilder.new(params).call_for_user(current_user.id)
    render 'articles/index'
  end
end

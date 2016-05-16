class ArticleRelationBuilder
  attr_reader :params, :main_chain

  def initialize(params = nil)
    @params = params
    @main_chain = Article.includes(:user).order(published_at: :desc)
  end

  def call_for_user(user_id)
    chain = main_chain.where(user_id: user_id)
    apply_filters(chain)
  end

  def call
    chain = main_chain.published
    apply_filters(chain)
  end

  private

  def apply_filters(chain)
    chain = chain.tagged_with(params[:tag]) if params[:tag]
    chain.page(params[:page])
  end

end

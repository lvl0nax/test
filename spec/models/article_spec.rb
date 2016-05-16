require 'rails_helper'

RSpec.describe Article do
  let!(:article) { FactoryGirl.create :article, published_at: nil }
  let!(:article2) { FactoryGirl.create :article, is_published: false }

  it 'created with published_at' do
    expect(article.published_at).not_to be_nil
  end

  it '#published scope returns only published articles' do
    expect(Article.published).to eq([article])
  end
end

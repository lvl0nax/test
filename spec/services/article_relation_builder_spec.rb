require 'rails_helper'

RSpec.describe ArticleRelationBuilder do
  let!(:user) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user }

  let!(:article1) { FactoryGirl.create :article, user_id: user.id, published_at: 3.days.ago }
  let!(:article2) { FactoryGirl.create :article, user_id: user2.id, published_at: 2.days.ago }
  let!(:article3) { FactoryGirl.create :article, user_id: user.id, tag_list: 'tag2', published_at: 1.days.ago }
  let!(:article4) { FactoryGirl.create :article, user_id: user2.id, is_published: false, published_at: 1.days.ago }

  it '#call_for_user returns article relation for target user' do
    expect(described_class.new({}).call_for_user(user2)).to eq([article4, article2])
  end

  it '#call returns article relation for tag2' do
    expect(described_class.new({tag: 'tag2'}).call).to eq([article3])
  end

  it '#call returns article relation for published articles' do
    expect(described_class.new({tag: 'tag1'}).call).to eq([article2, article1])
  end
end

require 'rails_helper'

RSpec.describe AccessChecker do
  let!(:user) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user }

  let!(:article1) { FactoryGirl.create :article, user_id: user.id }
  let!(:article2) { FactoryGirl.create :article, user_id: user2.id }
  let!(:comment1) { FactoryGirl.create :comment, user_id: user.id }
  let!(:comment2) { FactoryGirl.create :comment, user_id: user2.id }

  it 'returns true for article created by target user' do
    expect(described_class.new(user, article1).call).to be_truthy
  end

  it 'returns false for article does not created by target user' do
    expect(described_class.new(user, article2).call).to be_falsey
  end

  it 'returns true for comment created by target user' do
    expect(described_class.new(user, comment1).call).to be_truthy
  end

  it 'returns true for comment does not created by target user' do
    expect(described_class.new(user, comment2).call).to be_falsey
  end

end

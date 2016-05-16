FactoryGirl.define do
  factory :comment do
    content 'test_comment_content'
    user
  end
end

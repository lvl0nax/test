FactoryGirl.define do
  factory :article do
    title 'test_title'
    content 'test_content'
    published_at 1.day.ago
    tag_list 'tag1'
    is_published true
    user
  end
end

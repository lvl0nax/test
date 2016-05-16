FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{"%04d" % n}@gmail.com" }
    password 'password'
  end
end

FactoryGirl.define do
  factory :user do
    name      "John Doe"
    email     "email@example.com"
    password  "password"
    password_confirmation "password"
  end
end

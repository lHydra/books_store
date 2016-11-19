FactoryGirl.define do
  factory :user do
    sequence :email do |n| 
      Faker::Internet.email + "#{n}"
    end 
    password '123123'
    password_confirmation '123123'

    factory :user_with_free_book do
      transient do
        books_count 7
      end

      after(:create) do |user, evaluator|
        create_list(:book, evaluator.books_count, user: user)
      end
    end
  end
end

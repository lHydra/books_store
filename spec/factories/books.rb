FactoryGirl.define do
  factory :book do
    author 'user@mail.ru'
    title 'Some title'
    description Faker::Lorem.paragraph(3)
    image File.new("#{Rails.root}/public/attach/placeholder.png")

    factory :free_book do
      free true
    end
  end
end

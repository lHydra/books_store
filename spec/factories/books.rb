FactoryGirl.define do
  factory :book do
    author 'user@mail.ru'
    title 'Some title'
    description 'Lorem ipsum dolor sit amet,
                      consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean ma'
    image File.new("#{Rails.root}/public/attach/placeholder.png")

    factory :free_book do
      free true
    end
  end
end

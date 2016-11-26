require 'rails_helper'

feature 'create new book' do
  login_user

  scenario 'with valid params' do
    visit new_user_book_path(User.last.id)

    fill_in 'book_title', with: 'Крестный отец'
    fill_in 'book_description', with: 'роман Марио Пьюзо, изданный в 1969 году и рассказывающий о жизни одного из могущественных мафиозных кланов Америки — семье дона Корлеоне'
    attach_file :book_image, "#{Rails.root}/public/attach/placeholder.png"

    click_button 'Create Book'

    expect(page).to have_content('Book was successfully created')
  end

  scenario 'with invalid params' do
    visit new_user_book_path(User.last.id)

    fill_in 'book_title', with: 'К'
    fill_in 'book_description', with: 'роман Марио Пьюзо, изданный в 1969 году и рассказывающий о жизни одного из могущественных мафиозных кланов Америки — семье дона Корлеоне'
    attach_file :book_image, "#{Rails.root}/public/attach/placeholder.png"

    click_button 'Create Book'

    expect(page).to have_content('is too short (minimum is 4 characters)')
  end
end

feature 'access to books' do
  login_user

  given(:create_book) do
    visit new_user_book_path(User.last.id)

    fill_in 'book_title', with: 'Крестный отец'
    fill_in 'book_description', with: 'роман Марио Пьюзо, изданный в 1969 году и рассказывающий о жизни одного из могущественных мафиозных кланов Америки — семье дона Корлеоне'
    attach_file :book_image, "#{Rails.root}/public/attach/placeholder.png"

    click_button 'Create Book'
  end

  scenario 'can`t see close books without coupon' do
    create_book

    visit book_path(Book.last.id)
    expect(page).to have_content('Access Denied!')
  end

  scenario 'can see close book with coupon' do
    create_book 

    Book.last.coupons.create(code: 'qwerty')
    visit book_path(Book.last.id, coupon: 'qwerty')
    expect(page).to have_content('Крестный отец')
  end
end

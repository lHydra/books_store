module FeaturesMacros
  def login_user
    background do
      visit new_user_registration_path
      fill_in :user_email, with: 'some@mail.ru'
      fill_in :user_password, with: '123123'
      fill_in :user_password_confirmation, with: '123123'

      click_button 'Sign up'
    end
  end
end

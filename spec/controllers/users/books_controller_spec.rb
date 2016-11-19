require 'rails_helper'

RSpec.describe Users::BooksController, type: :controller do
  login_user

  describe 'GET #index' do
    before(:each) { get :index, params: { user_id: @user.id } }

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template(:index) }

    it 'should return all books by user' do
      create_list(:free_book, 3)
      create_list(:book, 3, user_id: @user.id)
      create(:book, user_id: 100)

      expect(assigns(:books).count).to eq(3)
    end
  end
end

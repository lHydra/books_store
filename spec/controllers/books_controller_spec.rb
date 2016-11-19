require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    before(:each) { get :index }

    it { is_expected.to render_template(:index) }
    it { is_expected.to respond_with(200) }

    context 'when books are free' do
      it 'contain an array of books' do
        books = create_list(:free_book, 3)
        expect(assigns(:books).reverse).to eq(books)
      end
    end

    context 'when books are close' do
      it 'should be blank' do
        books = create_list(:book, 3)
        expect(assigns(:books)).to eq([])
      end
    end

    context 'when some books free and close' do
      it 'should return only free books' do
        create_list(:book, 3)
        create_list(:free_book, 3)

        expect(assigns(:books).count).to eq(3)
      end
    end
  end

  describe 'GET #show' do
    context 'when book is free' do
      let(:book) { create(:free_book) }
      before(:each) { get :show, params: { id: book.id } }

      it { is_expected.to render_template(:show) }
      it { is_expected.to respond_with(200) }

      it 'should return book page' do
        expect(assigns(:book)).to eq(book)
      end
    end

    context 'when book is close' do
      let(:book) { create(:book) }
      before(:each) { get :show, params: { id: book.id } }

      it { is_expected.to redirect_to(root_path) }
      it { is_expected.to set_flash }

      it 'should access denied' do
        expect(flash[:alert]).to eq('Access Denied!')
      end
    end

    context 'when guest have valid coupon' do
      let(:book) { create(:book) }
      it 'should be valid page' do
        book.coupons.create!(code: 'xxxyyy')
        get :show, params: { id: book.id, coupon: 'xxxyyy' } 
        expect(response).to render_template(:show)
      end
    end

    context 'when guest have invalid coupon' do
      let(:book) { create(:book) }
      it 'should redirect to root' do
        book.coupons.create!(code: 'xxxyyy')
        get :show, params: { id: book.id, coupon: '123456' } 
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq('Access Denied!')
      end
    end
  end
end

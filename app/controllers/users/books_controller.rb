module Users
  class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_book, only: [:show, :edit, :update, :destroy, :download, :generate_coupon]

    def index
      @books = @user.books.all.order('created_at DESC').page(params[:page]).per(6)
    end

    def show
    end

    def new
      @book = @user.books.build
    end

    def edit
    end

    def create
      @book = @user.books.new(book_params)
      if @book.save
        respond_with @user, @book
      else
        respond_with @user, @book
      end
    end

    def update
      if @book.update(book_params)
        respond_with @user, @book
      else
        respond_with @user, @book
      end
    end

    def destroy
      @book.destroy
      respond_with @user, @book
    end

    def generate_coupon
      code = SecureRandom.hex[0..5]
      @book.coupons.create!(code: code)
      @url = url_for "localhost:3000/books/#{@book.id}?coupon=#{code}"
      respond_to do |format|
        format.html { render :show }
        format.js
      end
    end

    private
      def set_book
        @book = @user.books.find(params[:id])
      end

      def set_user
        @user = User.find(current_user.id)
      end

      def book_params
        params.require(:book).permit(:image, :title, :author, :description, :free, :document)
      end
  end
end

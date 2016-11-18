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

      respond_to do |format|
        if @book.save
          format.html { redirect_to [@user, @book], notice: 'Book was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @book.update(book_params)
          format.html { redirect_to [@user, @book], notice: 'Book was successfully updated.' }
          format.json { render :show, status: :ok, location: @book }
        else
          format.html { render :edit }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @book.destroy
      respond_to do |format|
        format.html { redirect_to user_books_path, notice: 'Book was successfully destroyed.' }
        format.json { head :no_content }
      end
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

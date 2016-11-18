module Users
  class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
      @user = User.find(params[:user_id])
      @books = Book.all
    end

    def show
      @user = User.find(params[:user_id])
    end

    def new
      @user = User.find(params[:user_id])
      @book = @user.books.build
    end

    def edit
      @user = User.find(params[:user_id])
    end

    def create
      @user = User.find(params[:user_id])
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
      @user = User.find(params[:user_id])
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

    private
      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:image, :title, :author, :description, :coupons)
      end
  end
end

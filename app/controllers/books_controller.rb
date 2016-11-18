class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def download
    @book = Book.find(params[:id])
    send_file @book.document.path, type: @book.document_content_type
  end

end

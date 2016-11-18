class BooksController < ApplicationController
  before_action :set_book, except: [:index]

  def index
    @books = Book.where(free: true)
                            .order('created_at DESC')
                            .page(params[:page]).per(6)
  end

  def show
    if @book.free? != true && @book.coupons.where(code: params[:coupon]).present? or @book.free?
      render :show
    else
      redirect_to root_path, alert: 'Access Denied!'
    end
  end

  def download
    send_file @book.document.path, type: @book.document_content_type
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end

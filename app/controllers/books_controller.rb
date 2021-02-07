class BooksController < ApplicationController
  # 本の投稿を管理するコントローラ


  def index
    @books = Book.all
    @book = Book.new
    @book.user_id = current_user.id

    # @user = User.find(@book.user_id)

  end

  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)

  end


  private

  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
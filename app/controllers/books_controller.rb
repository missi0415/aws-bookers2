class BooksController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  # 本の投稿を管理するコントローラ


  def index
    @books = Book.all
    @book = Book.new
    @book.user_id = current_user.id

    # @user = User.find(@book.user_id)
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:complete] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    #変数の名前を変える
    @user = current_user.id

  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
        if @book.update(book_params)
          flash[:complete] = "Book was successfully created."
          redirect_to book_path(@book.id)
        else
          render :edit
        end
  end


  private

  def book_params
    params.require(:book).permit(:user_id, :title, :body)
  end
end
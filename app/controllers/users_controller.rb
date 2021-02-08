class UsersController < ApplicationController
before_action :authenticate_user!,except: [:top]
  def index
    @users = User.all
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    # ユーザのデータを1件取得し、インスタンス変数へ渡す
    @books = @user.books
    @book = Book.new
  end

  def edit
  @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

    private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end

class UsersController < ApplicationController

  def index
    @users = User.all

  end


  def show
    @user = User.find(params[:id])
    # ユーザのデータを1件取得し、インスタンス変数へ渡す
    @books = Book.all
  end

  def edit
  @user = User.find(params[:id])
  end

  def create

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

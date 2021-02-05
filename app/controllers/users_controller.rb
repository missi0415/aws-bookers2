class UsersController < ApplicationController
  def show
    @user = User.find[:id]
    # ユーザのデータを1件取得し、インスタンス変数へ渡
  end
end

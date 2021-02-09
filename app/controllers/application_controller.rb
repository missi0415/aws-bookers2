class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top,:about]
  # authenticate_userメソッドは、devise側が用意しているメソッド
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。

  def after_sign_in_path_for(resource)
      user_path(resource)
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end
  #configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
  # ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可。
  # privateは、。一方、protectedは呼び出された他のコントローラからも参照できます。



end

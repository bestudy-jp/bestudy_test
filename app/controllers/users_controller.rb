class UsersController < ApplicationController
  def create

    if env['omniauth.auth'].present?
      # Facebookログイン
      @user  = User.from_omniauth(env['omniauth.auth'])
      result = @user.save(context: :facebook_login)
      fb       = "Facebook"
    else
      # 通常サインアップ
      @user  = User.new(strong_params)
      result = @user.save
      fb       = ""
    end
    if result
      session[:user_id] = @user.id

      flash[:success] = "#{fb}ログインしました。"
      redirect_to '/home/question'
    else
      if fb.present?
        redirect_to auth_failure_path
      else
        render 'new'
      end
    end
  end

end

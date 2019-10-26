class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(user_email_params)
    if user && user.authenticate(user_password_params[:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def user_email_params
    params.require(:session).permit(:email)
  end
  
  def user_password_params
    params.require(:session).permit(:password)
  end
end

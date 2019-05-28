module SessionsHelper
  #記憶トークンcookieに対応するユーザを返す
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
         session[:user_id] = user.id
         @current_user = user
      end
    end
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user?(user)
    user == current_user
  end
  
  #ユーザのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  #永続セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
    #session[:user_id]に一致するユーザーが存在する場合は@current_userにログイン中のユーザー（現在のユーザー）が入る
    #nilの場合は@current_userにnilが入る。
  end

  def logged_in?
    !!current_user
    #current_userが存在する場合はtrueを、nilの場合はfalse
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
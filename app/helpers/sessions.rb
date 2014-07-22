helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
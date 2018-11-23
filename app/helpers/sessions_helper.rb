module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 渡されたユーザーがログイン済みのユーザーである場合trueを返す
  def current_user?(user)
    user == current_user
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
   if session[:user_id]
     @current_user ||= User.find_by(id: session[:user_id])
   end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end


  # Placeの削除ボタンで元のURLへ戻る
  def redirect_before_url(default = root_path)
      return session[:before_forwarding_url] || default
      session.delete(:before_forwarding_url)
  end

  # 次の画面へアクセスする前に現在のURLを覚えておく
  def before_location(current_url)
    session[:before_forwarding_url] = current_url
  end
end

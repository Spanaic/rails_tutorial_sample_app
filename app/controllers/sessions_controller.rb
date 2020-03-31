class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) # sessionにもcookiesにも記憶させないということ(forget)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
    render :new
    end
  end

  def destroy
    log_out if logged_in? # current_userが居るかどうか確認することで、別タブでログアウトされた場合に備える
    redirect_to root_url  # 処理の前に真偽値による条件分岐を行うことで、エラーを出さずに処理が実行されるように備える
  end                     # log_outの処理が行われないだけで、redirectは行われる if logged_in
end

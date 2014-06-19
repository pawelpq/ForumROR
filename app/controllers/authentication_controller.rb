class AuthenticationController < ApplicationController
  def sign_in
    @user = User.new
  end
  
  def login
    login_or_email = params[:user][:login]
    password = params[:user][:password_digest]

    if login_or_email.rindex('@')
      email=login_or_email
      user = User.authenticate_by_email(email, password)
    else
      login=login_or_email
      user = User.authenticate_by_login(login, password)
    end

    if user
      session[:user_id] = user.id
      redirect_to "/home/index"
    else
      @user = User.new
      redirect_to :action => "sign_in"
    end

  end
  
  def signed_out
    session[:user_id] = nil
    redirect_to "/home/index"
  end
  
  def new_user
    redirect_to new_user_path
  end
  
  def auto_login
    if @user
      session[:user_id] = @user.id
      redirect_to "/home/index"
    else
      render :action => "new_user"
    end
end
end

class AuthorizationsController < ApplicationController
  def new
  end

  def callback
    sign_up_sign_in = SignupSigninPresenter.new(request.env['omniauth.auth'])
    if sign_up_sign_in.create_authorization_o
      flash[:notice] = "Welcome back #{authorization.full_name}"
    else
      sign_up_sign_in.create_authorization
      flash[:notice] = "Welcome #{authorization.full_name}"
    end
    session[:user_id] = sign_up_sign_in.retrieve_id
    redirect_to pages_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end


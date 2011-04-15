class AuthorizationsController < ApplicationController
  def new
  end

  def callback
    sign_up_sign_in = SignupSigninPresenter.new(request.env['omniauth.auth'])
    if  sign_up_sign_in.create_or_find_authorization == :found
      flash[:notice] = "Welcome back #{sign_up_sign_in.full_name}"
    else
      flash[:notice] = "Welcome #{sign_up_sign_in.full_name}"
    end
    session[:user_id] = sign_up_sign_in.retrieve_id
    redirect_to pages_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end


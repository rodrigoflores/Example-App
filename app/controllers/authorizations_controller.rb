class AuthorizationsController < ApplicationController
  def new
  end

  def callback
    my_request = request.env['omniauth.auth']
    if authorization = Authorization.find_by_uid(request['uid'])
      flash[:notice] = "Welcome back #{authorization.full_name}"
    else
      authorization = Authorization.new(:uid => my_request['uid'], :full_name => "#{my_request['user_info']['first_name']} #{my_request["user_info"]['last_name']}", :provider => my_request["provider"])
      authorization.save
      flash[:notice] = "Welcome #{authorization.full_name}"
    end
    session[:user_id] = authorization.id
    redirect_to pages_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end


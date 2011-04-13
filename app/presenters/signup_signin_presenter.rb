class SignupSigninPresenter
  def initialize(params)
    @uid = params['uid']
    @provider = params['provider']
    @full_name = "#{params['user_info']['first_name']} #{params['user_info']['last_name']}"
    @authorization = Authorization.find_by_uid(@uid)
  end

  def existent?
    !!@authorization
  end

  def create_or_find_authorization
    @authorization = Authorization.create(:full_name => @full_name, :provider => @provider, :uid => @uid) unless @authorization
  end

  def retrieve_id
    @authorization.id
  end
end

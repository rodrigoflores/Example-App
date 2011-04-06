require 'spec_helper'

describe 'visiting the homepage' do
  before do
    visit '/'
  end

  it 'should have a facebook link' do
    page.should have_css("a[href='/auth/facebook']", :text => "Facebook")
  end

  it 'should log me in when I click on the facebook link' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = {
      'uid' => '123545',
      'provider' => 'facebook',
      'user_info' => { 'first_name' => "Elizabeth", 'last_name' => "Hurley"}
    }
    click_link "Facebook"
    page.should have_css("h1", :text => "Welcome Elizabeth Hurley")
    OmniAuth.config.test_mode = false
  end

  it 'should log me out when I click on the log out icon' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = {
      'uid' => '123545',
      'provider' => 'facebook',
      'user_info' => { 'first_name' => "Elizabeth", 'last_name' => "Hurley"}
    }
    click_link "Facebook"
    click_link "Log out"
    page.should have_css("a[href='/auth/facebook']", :text => "Facebook")
    OmniAuth.config.test_mode = false
  end

end

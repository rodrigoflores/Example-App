require 'spec_helper'

describe Bookmark do
  it { should validate_presence_of :url }

  describe '#schema' do
    it "should return 'http' we have a http schema" do
      url = Bookmark.create(:url => "http://www.google.com")
      url.scheme.should == "http"
    end

    it "should return 'https' when we have a https schema" do
      url = Bookmark.create(:url => "https://www.facebook.com")
      url.scheme.should == "https"
    end

    describe '#host' do
      it "should return 'www.google.com' if we have a http://www.google.com url" do
        url = Bookmark.create(:url => "http://www.google.com")
        url.host.should == "www.google.com"
      end
    end

    describe '#path' do
      it "should return '/reader' if we have a http://www.google.com/reader" do
        url = Bookmark.create(:url => "http://www.google.com/reader")
        url.path.should == "/reader"
      end

    end

  end
end

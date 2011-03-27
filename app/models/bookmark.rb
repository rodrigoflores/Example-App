class Bookmark < ActiveRecord::Base
  validates_presence_of :url

  delegate :scheme, :host, :path, :to => :parsed_url

  def parsed_url
    @uri ||= URI.parse(url)
    @uri
  end
end

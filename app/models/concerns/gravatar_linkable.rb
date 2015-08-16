require 'digest/md5'

module GravatarLinkable
  extend ActiveSupport::Concern

  def gravatar_url
    email = self.email.downcase
    return "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end

end
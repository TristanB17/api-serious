class User < ApplicationRecord
  def self.create_with_omniauth(auth)
    create(provider: auth[:provider],
          uid: auth[:uid],
          name: auth[:info][:name],
          token: auth[:credentials][:token],
          image: auth[:extra][:raw_info][:avatar_url],
          username: auth[:extra][:raw_info][:login])
  end
end

class User < ApplicationRecord
  def self.create_with_omniauth(auth)
    create(provider: auth[:provider], uid: auth[:uid], name: auth[:info][:name])
  end
end

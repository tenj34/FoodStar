class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find do |user| user.slug == slug end
  end
end

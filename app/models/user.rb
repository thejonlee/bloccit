class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # inline callback
  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }
  # self.role ||= :member is shorthand for self.role = :member if self.role.nil?

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
# first validation ensures a valid password upon creation, second upon password update
  validates :password, presence: true, length: { minimum: 6 }, if: lambda {password_digest.nil?}
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

# Ruby class method, requires BCrypt
  has_secure_password

  enum role: [:member, :admin]

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end

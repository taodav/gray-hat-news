class User < ActiveRecord::Base
  include BCrypt

  has_many :posts
  has_many :comments, class_name: "Note"
  has_many :replies, class_name: "Note"
  has_many :votes

  validates :username, :password_hash, :email, presence: true
  validates :username, length: { in: 2..20 }, uniqueness: true
  validates :email, format: { with: /\S+[@]\S+[.]\S+/,
    message: "has to be a valid email" }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

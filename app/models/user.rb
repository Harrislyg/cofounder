class User < ActiveRecord::Base
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable
  has_many :user_categories
  has_many :categories, through: :user_categories
  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: 105}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}

  has_secure_password

end

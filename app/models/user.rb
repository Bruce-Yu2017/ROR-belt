class User < ActiveRecord::Base
  has_secure_password
  has_many :groups, dependent: :destroy
  has_many :groups_joined, through: :joins, source: :group
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :first_name, :last_name, presence: true
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

end

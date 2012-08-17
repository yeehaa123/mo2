class Identity
  include Mongoid::Document
  include OmniAuth::Identity::Models::Mongoid
  
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password

	before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  		uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
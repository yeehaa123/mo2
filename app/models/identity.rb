class Identity
  include Mongoid::Document
  include OmniAuth::Identity::Models::Mongoid
  
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
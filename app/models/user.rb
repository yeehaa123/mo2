class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Versioning

  field :user_name, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :remember_token, type: String
  field :roles_mask, type: Integer

  index({ email: 1 }, { unique: true, name: "index_users_on_email"})
  index({ remember_token: 1 })

  has_many :authorizations, dependent: :delete
  
  validates :user_name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
      uniqueness: { case_sensitive: false }

  attr_accessible :user_name, :email, :image, :first_name, :last_name, :roles
  
  before_save { self.email.downcase! }
  before_save { self.remember_token = SecureRandom.urlsafe_base64 }

  ROLES = %w[admin]

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.where(auth_hash.slice("provider", "uid")).first
      Authorization.create!(user: self, 
                            provider: auth_hash["provider"], 
                            uid: auth_hash["uid"])
    end
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end
end

  # def self.from_omniauth(auth)
  #   where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  # end
  
  # def self.create_from_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"]
  #     user.email = auth["info"]["email"]
  #     user.image = auth["info"]["image"] 
  #   end
  # end
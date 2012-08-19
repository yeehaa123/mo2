class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Versioning

  field :name, type: String
  field :email, type: String
  field :remember_token, type: String

  index({ email: 1 }, { unique: true, name: "index_users_on_email"})
  index({ remember_token: 1 })

  has_many :authorizations, dependent: :delete
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  attr_accessible :name, :email, :image

  before_save { self.email.downcase! }
  before_save { self.remember_token = SecureRandom.urlsafe_base64 }

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.where(auth_hash.slice("provider", "uid")).first
      Authorization.create!(user: self, 
                            provider: auth_hash["provider"], 
                            uid: auth_hash["uid"])
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
end
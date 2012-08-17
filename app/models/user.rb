class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Versioning

  # field :provider, type: String
  # field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :image, type: String
  
  index({ email: 1 }, { unique: true, name: "index_users_on_email"})

  has_many :authorizations
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  attr_accessible :name, :email, :image

  before_save { self.email.downcase! }

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.where(auth_hash.slice("provider", "uid")).first
      Authorization.create(user: self, 
                           provider: auth_hash["provider"], 
                           uid: auth_hash["uid"])
    end
  end
end
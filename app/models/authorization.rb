class Authorization
  include Mongoid::Document

  field :provider, type: String
  field :uid, type: String

  belongs_to :user
  validates :provider, :uid, presence: true

	def self.find_or_create(auth_hash)
    unless auth = self.where(provider: auth_hash["provider"], uid: auth_hash["uid"]).first
      user = User.create(name: auth_hash["info"]["name"], email: auth_hash["info"]["email"])
      auth = self.create(user: user, provider: auth_hash["provider"], uid: auth_hash["uid"])
    end

    auth
  end
end
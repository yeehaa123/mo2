class Authorization
  include Mongoid::Document
	
  field :provider, type: String
  field :uid, type: String

  belongs_to :user
  validates :user_id, :provider, :uid, presence: true
	
	attr_accessible :user, :provider, :uid

	def self.find_or_create(auth_hash)
    unless auth = where(auth_hash.slice("provider", "uid")).first
      user = User.create(name: auth_hash["info"]["name"], 
      									 email: auth_hash["info"]["email"])
      auth = create(user: user, 
      							provider: auth_hash["provider"], 
      							uid: auth_hash["uid"])
    end
    auth
  end

  def to_s
  	"#{ provider } - #{ uid }"
  end
end
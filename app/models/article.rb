class Article
  include Mongoid::Document
	include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Versioning

  field :content, type: String
	
	index({ user_id: 1, created_at: 1 })

	attr_accessible :title, :content

	belongs_to :user

	validates :user_id, presence: true
	validates :content, presence: true

	default_scope order_by(:created_at => :desc)
end
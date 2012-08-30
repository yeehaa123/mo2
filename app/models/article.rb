class Article
  include Mongoid::Document
	include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Slugify


  field :content, type: String
  field :title, type: String
	
	index({ user_id: 1, created_at: 1 })

	attr_accessible :title, :content

	belongs_to :user

	validates :user_id, presence: true
	validates :content, presence: true
	validates :title, presence: true

	default_scope order_by(:created_at => :desc)

	before_validation { self.title = $1 if content.match(/\A\s*#\s*(.+)\s*$/)}

	private
    def generate_slug
      title.parameterize
    end
end
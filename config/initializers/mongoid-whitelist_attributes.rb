module Mongoid
	module WhitelistAttributes
		extend ActiveSupport::Concern

		included do
			attr_accessible nil
		end
	end

	module Document
		include WhitelistAttributes
	end
end
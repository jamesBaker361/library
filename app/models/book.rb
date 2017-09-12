class Book < ApplicationRecord
	after_initialize :default_values

	def default_values
		self.votes ||=0
	end
end

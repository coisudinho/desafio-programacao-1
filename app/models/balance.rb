class Balance < ApplicationRecord
	has_many :entries, dependent: :destroy
	accepts_nested_attributes_for :entries

	def self.total
		sum(:total) || 0
	end
end

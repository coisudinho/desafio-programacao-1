class Entry < ApplicationRecord
	belongs_to :balance, autosave: true

	def self.total
		sum(:item_price) || 0
	end

	def self.import(file)
		require 'csv'

		@entries	= []

		CSV.parse(File.read(file),{headers: true ,col_sep: "\t"}).each do |row|
			 @entries << Hash[row.collect {|c,r| [c.gsub(" ","_"), r.split.join(' ')]}]
		end

		@data = {
			entries: @entries,
			total: @entries.map { |h| h["item_price"].to_f }.sum
		}

		return @data
	end
end

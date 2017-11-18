class CreateEntries < ActiveRecord::Migration[5.1]
	def change
		create_table :entries do |t|
			t.references :balance		, foreign_key: true
			t.string	:purchaser_name	, limit: 64
			t.string	:item_description	, limit: 64
			t.decimal	:item_price		, precision: 8, scale: 2
			t.integer	:purchase_count
			t.string	:merchant_address	, limit: 64
			t.string	:merchant_name		, limit: 64

			t.timestamps
		end
	end
end

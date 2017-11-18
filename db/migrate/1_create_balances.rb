class CreateBalances < ActiveRecord::Migration[5.1]
	def change
		create_table :balances do |t|
			t.string	:description	, limit: 32
			t.decimal	:total		, precision: 8, scale: 2

			t.timestamps
		end
	end
end

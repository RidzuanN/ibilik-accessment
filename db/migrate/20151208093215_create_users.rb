class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |m|
			m.string :name
			m.string :email
			m.string :password
			m.integer :contact

			m.timestamps null: false
		end
	end
end

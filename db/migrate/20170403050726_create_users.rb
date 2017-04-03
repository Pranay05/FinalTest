class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

    	t.string :first_name
    	t.string  :last_name
    	t.string :email,              null: false
        t.string :password_digest,    null: false
        t.string  :role
        t.date  :dob 
        t.string :country
        t.string :state
        t.string :city
        t.string :zip
        t.string :street
        t.boolean :kids
        t.date  :kingdom_today
        	
      t.timestamps
    end
  end
end

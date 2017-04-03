class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|

    	t.string :liked_place
    	t.float :latitude
        t.float :longitude
    	t.references :user, index: true

      t.timestamps
    end
  end
end

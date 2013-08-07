class CreateAdherentes < ActiveRecord::Migration
  def change
    create_table :adherentes do |t|

      t.timestamps
    end
  end
end

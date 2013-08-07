class AddComiteIdToAdherentes < ActiveRecord::Migration
  def change
    add_column :adherentes, :comite_id, :integer
  end
end

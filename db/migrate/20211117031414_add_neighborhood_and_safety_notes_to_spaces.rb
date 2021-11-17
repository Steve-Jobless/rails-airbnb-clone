class AddNeighborhoodAndSafetyNotesToSpaces < ActiveRecord::Migration[6.0]
  def change
    add_column :spaces, :neighborhood, :string
    add_column :spaces, :safety_note, :string
  end
end

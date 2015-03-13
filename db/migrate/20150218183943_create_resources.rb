class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :archetype_id
      t.string :literal

      t.timestamps
    end
  end
end

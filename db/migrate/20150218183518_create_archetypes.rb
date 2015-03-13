class CreateArchetypes < ActiveRecord::Migration
  def change
    create_table :archetypes do |t|
      t.integer :namespace_id
      t.string :name
      t.boolean :routable

      t.timestamps
    end
  end
end

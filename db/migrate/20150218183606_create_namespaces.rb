class CreateNamespaces < ActiveRecord::Migration
  def change
    create_table :namespaces do |t|
      t.string :uri
      t.string :name

      t.timestamps
    end
  end
end

class AddLanguageIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :language_id, :integer
  end
end

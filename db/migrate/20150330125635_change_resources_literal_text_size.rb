class ChangeResourcesLiteralTextSize < ActiveRecord::Migration
  def change
    change_column :resources, :literal, :text, :limit => 65535
  end
end

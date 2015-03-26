class ChangeResourceLiteralToText < ActiveRecord::Migration
  def change
    change_column :resources, :literal, :text
  end
end

class AddUrlToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :url, :string
  end
end

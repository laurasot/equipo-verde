class AddImageUrlToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :image_url, :string
  end
end

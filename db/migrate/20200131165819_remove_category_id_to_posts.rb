class RemoveCategoryIdToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :category_id, :integer
  end
end

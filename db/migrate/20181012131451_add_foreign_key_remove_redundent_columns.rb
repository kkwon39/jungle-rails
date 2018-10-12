class AddForeignKeyRemoveRedundentColumns < ActiveRecord::Migration
  def change
    remove_column :reviews, :product_id, :integer
    remove_column :reviews, :user_id, :integer
    add_reference :reviews, :product, foreign_key: true
    add_reference :reviews, :user, foreign_key: true
  end
end

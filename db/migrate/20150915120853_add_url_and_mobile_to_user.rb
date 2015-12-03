class AddUrlAndMobileToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :string
    add_column :users, :url, :string
  end
end

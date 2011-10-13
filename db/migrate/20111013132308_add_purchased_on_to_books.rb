class AddPurchasedOnToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :purchased_on, :date
  end

  def self.down
    remove_column :books, :purchased_on
  end
end

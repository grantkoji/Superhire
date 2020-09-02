class ChangeColumnNameIsPremiumInUsersToIsPremium < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_premium?, :is_premium 
  end
end

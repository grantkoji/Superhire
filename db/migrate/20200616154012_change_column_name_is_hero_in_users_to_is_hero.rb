class ChangeColumnNameIsHeroInUsersToIsHero < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :is_hero?, :is_hero 
  end
end

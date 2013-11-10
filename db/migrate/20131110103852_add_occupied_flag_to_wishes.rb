class AddOccupiedFlagToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :occupied_flag, :boolean, default: false
  end
end

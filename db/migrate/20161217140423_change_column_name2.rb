class ChangeColumnName2 < ActiveRecord::Migration[5.0]
  def change
    rename_column :campaigns, :campaign, :category
  end
end

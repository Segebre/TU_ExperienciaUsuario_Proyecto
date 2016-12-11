class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.text :author
      t.text :message
      t.decimal :amount
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end

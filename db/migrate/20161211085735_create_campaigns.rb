class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.text :title
      t.text :description
      t.text :review
      t.decimal :goal
      t.text :campaign
      t.text :imageurl
      t.references :user, foreign_key: true
      t.integer :likes
      t.datetime :ended_at

      t.timestamps
    end
  end
end

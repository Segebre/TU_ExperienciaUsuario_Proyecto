class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :email
      t.text :name
      t.text :password
      t.text :city
      t.text :country
      t.boolean :isreceivingmail

      t.timestamps
    end
  end
end

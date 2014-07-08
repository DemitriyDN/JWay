class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.integer :last_id

      t.timestamps
    end
  end
end

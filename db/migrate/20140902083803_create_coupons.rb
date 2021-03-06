class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :user_id
      t.integer :amount
      t.string :title
      t.text :content
      t.datetime :expired_at
      t.timestamps
    end
  end
end

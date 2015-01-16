class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.string :name
      t.string :email
      t.string :department
      t.text :message
      t.boolean :action

      t.timestamps null: false
    end
  end
end

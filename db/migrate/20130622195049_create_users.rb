class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.string :real_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, comment: 'Users table' do |t|
      t.string :login, comment: 'User`s login'
      t.string :password, comment: 'User`s password'
      t.string :name, comment: 'User`s name'
      t.string :email, comment: 'User`s email'

      t.timestamps
    end
    add_index :users, :login, unique: true, comment: 'Index used to lookup user by login'
  end
end

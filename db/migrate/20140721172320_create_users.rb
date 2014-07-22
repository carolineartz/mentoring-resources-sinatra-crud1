class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash

      t.timestamps
    end

      add_column :notes, :user_id, :integer # if you're adding users to an existing app, make sure to
  end                                       # add a new column for the user's id to associated tables
end                                         # where the user has_many



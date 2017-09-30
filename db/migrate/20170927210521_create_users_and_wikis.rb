class CreateUsersAndWikis < ActiveRecord::Migration
  def change
   create_table :collaborators do |t|
       t.integer :wikis
       t.integer :users
       t.timestamps
     end
 
     add_index :users, :id, unique: true
     add_index :wikis, :id, unique: true
     add_index :collaborators, :id, unique: true
     add_index :collaborators, :user_id
     add_index :collaborators, :wiki_id
  end
end

# SQLite3::SQLException: table collaborators has no column named user_id: CREATE  INDEX "index_collaborators_on_user_id" ON "collaborators" ("user_id")

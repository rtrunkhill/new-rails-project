class CreateCollabortors < ActiveRecord::Migration
  def change
    create_table :collabortors do |t|
      t.integer :wikis
      t.integer :users
      t.timestamps
    end
    
    add_index :wikis, :id, unique: true
    add_index :users, :id, unique: true
    add_index :collabortors, :id, unique: true
    add_index :collabortors, :wiki_id
    add_index :collabortors, :user_id
   
  end
end

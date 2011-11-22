class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :organization
      t.string :name

      t.timestamps
    end
    add_index :users, :organization_id
  end
end

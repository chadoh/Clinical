class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :patients, :user_id
  end
end

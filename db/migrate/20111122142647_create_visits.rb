class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :patient_authorization
      t.string :name

      t.timestamps
    end
    add_index :visits, :patient_authorization_id
  end
end

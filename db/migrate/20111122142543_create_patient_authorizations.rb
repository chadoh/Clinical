class CreatePatientAuthorizations < ActiveRecord::Migration
  def change
    create_table :patient_authorizations do |t|
      t.references :patient
      t.string :name

      t.timestamps
    end
    add_index :patient_authorizations, :patient_id
  end
end

class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.integer :supervisor_id
      t.string :first_name
      t.string :last_name
      t.string :major
      t.string :minor

      t.timestamps
    end
  end
end

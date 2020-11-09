class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :education
      t.references :hospital, foreign_key: true
    end
  end
end

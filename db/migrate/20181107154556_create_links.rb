class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :name
      t.text :url
      t.text :comment
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end

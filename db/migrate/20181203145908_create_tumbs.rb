class CreateTumbs < ActiveRecord::Migration[5.2]
  def change
    create_table :tumbs do |t|
      t.string :screen_url
      t.timestamps
    end
  end
end

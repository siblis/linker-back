class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links, comment: 'Links table' do |t|
      t.string :name, comment: 'Link`s name'
      t.text :url, comment: 'Link`s url'
      t.text :comment, comment: 'Comment to link'
      t.references :collection, foreign_key: true, comment: 'Link belongs to collection'

      t.timestamps
    end
  end
end

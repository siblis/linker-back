class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections, comment: 'Collections table' do |t|
      t.string :name, comment: 'Collections`s name'
      t.text :url, comment: 'Collection`s url'
      t.text :comment, comment: 'Comment to collection'
      t.references :user, foreign_key: true, comment: 'Collection belongs to user'

      t.timestamps
    end
  end
end

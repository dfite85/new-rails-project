class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
      t.boolean :private
    end
  end
end

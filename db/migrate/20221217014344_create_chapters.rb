class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :content
      t.text :notice
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end

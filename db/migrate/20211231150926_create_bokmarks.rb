class CreateBokmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bokmarks do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.references :site, null: true, foreign_key: true
      t.text :url_text
      t.text :photo_url
      t.string :bookmark_type, default: 'file'

      t.timestamps
    end
  end
end

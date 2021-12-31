class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :title , index: { unique: true, name: 'unique_site_title' }
      t.text :url

      t.timestamps
    end
  end
end

class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :title, index: { unique: true, name: 'unique_tag_title' }

      t.timestamps
    end
  end
end

class CreateJoinTableTagBokmark < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tags, :bokmarks do |t|
      t.index [:bokmark_id, :tag_id]
    end
  end
end

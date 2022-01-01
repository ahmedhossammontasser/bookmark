class AddShortenUrlToBokmark < ActiveRecord::Migration[7.0]
  def change
    add_column :bokmarks, :shorten_url, :text
  end
end

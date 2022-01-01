# == Schema Information
#
# Table name: bokmarks
#
#  id            :integer          not null, primary key
#  title         :string
#  user_id       :integer          not null
#  site_id       :integer
#  url_text      :text
#  photo_url     :text
#  bookmark_type :string           default("file")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ancestry      :string
#

class Bokmark < ApplicationRecord
	has_ancestry
	belongs_to :user
	belongs_to :site , optional: true
	enum bookmark_type: {file:"file" , folder:"folder"}
	
end

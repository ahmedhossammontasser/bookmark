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
#  shorten_url   :text
#

class Bokmark < ApplicationRecord
	has_ancestry
	belongs_to :user
	belongs_to :site , optional: true
    validates_presence_of :title
	enum bookmark_type: {file:"file" , folder:"folder"}
	
	has_and_belongs_to_many :tags
	accepts_nested_attributes_for :tags

end

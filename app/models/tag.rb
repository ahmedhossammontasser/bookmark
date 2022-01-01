# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
    validates_uniqueness_of :title
    validates_presence_of :title    
	has_and_belongs_to_many :bokmarks
end

# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ApplicationRecord
end

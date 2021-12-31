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

require 'rails_helper'

RSpec.describe Site, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

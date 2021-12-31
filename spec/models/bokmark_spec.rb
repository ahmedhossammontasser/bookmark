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

require 'rails_helper'

RSpec.describe Bokmark, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

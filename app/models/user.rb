# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :validatable
	has_many :bokmarks
	has_many :sites, through: :bokmarks
	def generate_jwt
		secret_key_base = ENV.fetch("SECRET_KEY_BASE") || Rails.application.secrets.secret_key_base
		JWT.encode({id: id, exp: 60.days.from_now.to_i}, secret_key_base)
	end
	  
end

class RegistrationsController < Devise::RegistrationsController


	'''
		Create root_bokmark obj with folder object 
	''' 
	def create
		ActiveRecord::Base.transaction do  
			user = User.new(sign_up_params)
			if user.save
				user.bokmarks.create( 
					title: user.email ,
					bookmark_type: Bokmark.bookmark_types[:folder]
				)
				token = user.generate_jwt
				render json: token.to_json
			else
				render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
			end
		end
	end

end
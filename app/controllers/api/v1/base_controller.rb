module Api
	module V1
		class BaseController <  ActionController::Base
			include DeviseTokenAuth::Concerns::SetUserByToken 
				
			  skip_before_action :verify_authenticity_token 
 				 def json_request?
				    request.format.json?
				  end
		end
	end
end
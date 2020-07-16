require 'byebug'
class UserRoutes < Application
  prepend Validations
  prepend ApiErrors
  
  post do
    user_params = validate_with!(UserParamsContract)
   
    result = Users::CreateService.call(
      *user_params.to_h.values
    )
    byebug
    if result.success?
      response.status = 201
    else
      response.status = 422
      error_response result.user
    end
  end
end

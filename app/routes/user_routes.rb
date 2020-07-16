class UserRoutes < Application
  prepend Validations
  prepend ApiErrors
  
  post "/" do
    user_params = validate_with!(UserParamsContract)

    result = Users::CreateService.call(
      user: user_params
    )
    if result.success?
      response.status = 201
    else
      response.status = 422
      error_response result.user
    end
  end
end

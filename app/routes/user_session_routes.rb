require 'byebug'
class UserSessionRoutes < Application
  prepend Validations
  prepend ApiErrors
  post do
    byebug
    session_params = validate_with!(SessionParamsContract)
    result = UserSessions::CreateService.call(*session_params.to_h.values)

    if result.success?
      token = JwtEncoder.encode(uuid: result.session.uuid)
      meta = { token: token }
      response.status = 201
      { meta: meta }.to_json
    else
      response.status = 401
      error_response(result.session || result.errors)
    end
  end
end

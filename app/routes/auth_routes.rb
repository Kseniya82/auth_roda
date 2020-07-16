class AuthRoutes < Application
  prepend Auth
  prepend Validations
  prepend ApiErrors

  post do
    result = Auth::FetchUserService.call(extracted_token)
    if result.success?
      response.status = 200
      { meta: { user_id: result.user.id } }.to_json
    else
      response.status = 403
      error_response(result.errors)
    end
  end
end

class UserParamsContract < Dry::Validation::Contract
  params do
    required(:user).hash do
      required(:email).filled(:string)
      required(:name).filled(:string)
      required(:password).filled(:string)
    end
  end
end

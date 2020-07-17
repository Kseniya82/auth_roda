module Validations
  class InvalidParams < StandardError; end

  def validate_with!(validation)
    validate_with(validation)
  end

  def validate_with(validation)
    contract = validation.new
    contract.call(params)
  end
end

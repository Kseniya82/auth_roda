class User < Sequel::Model
  NAME_FORMAT = %r{\A\w+\z}

  plugin :association_dependencies
  plugin :secure_password, include_validations: false

  one_to_many :sessions, class: :UserSession

  def validate
    super
    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :password, message: I18n.t(:blank, scope: 'model.errors.user.password')
    validates_format NAME_FORMAT, :name, 
                     message: I18n.t(:invalid_format, scope: 'model.errors.user.name')
  end
end

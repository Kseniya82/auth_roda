task :settings do
  require 'config'
  require 'sequel'
  require 'sequel-seed'
  require_relative '../config/initializers/config'
  require_relative '../config/initializers/db'
end

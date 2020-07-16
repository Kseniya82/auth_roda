require 'sequel/core'
require 'sequel/extensions/seed'
Sequel.extension :seed

namespace :db do
  desc 'Load initial data in db'
  task :seed => :settings do |t, args|
    Sequel::Seeder.apply(DB, 'db/seeds/')
  end
end

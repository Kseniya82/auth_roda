namespase :db do
  desc 'Load initial data in db'
  task :seed => :settings do
    Sequel::Seeder.apply(DB, “db/seeds/“)
  end
end

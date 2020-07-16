require_relative '../../config/environment'
Sequel.seed do
  def run
    users = [
      { name: 'noname',
        email: 'user@example.com',
        password: '123456' },
      { name: 'clever',
        email: 'clever@example.com',
        password: '654321' }, 
      { name: 'older',
        email: 'older@example.com',
        password: 'mypass' }
    ]

    users.each { |user| User.create(user) }
  end
end
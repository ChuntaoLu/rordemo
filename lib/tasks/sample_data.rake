namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create(name: 'chuntao', email: 'chuntaolu13@gmail.com',
                        password: 'foobar', password_confirmation: 'foobar')
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example#{n}@aol.com"
      password = "foobar"
      User.create(name: name, email: email, password: password,
                  password_confirmation: password)
    end
  end
end
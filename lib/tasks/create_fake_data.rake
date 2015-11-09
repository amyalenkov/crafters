namespace :db do

  desc 'general task: prepare db for check crafters'
  task :delete_old_and_create_new_crafters => [:delete_all_crafters,
                                               :create_fake_crafters]


  desc 'create fake crafters'
  task :create_fake_crafters => :environment do
    require 'populator'
    require 'faker'
    Crafter.populate 100 do |crafter|
      crafter.email = Faker::Internet.email
      crafter.description = Populator.sentences(2..10)
      crafter.company_name = Faker::Company.name
      crafter.city = Faker::Address.city
      crafter.address = Faker::Address.street_address
      crafter.phone_number = Faker::PhoneNumber.phone_number
      crafter.contact_person = Faker::Name.name
      crafter.check = true
      crafter.subcategory_id = Faker::Number.between(1, 377)
      crafter.encrypted_password = Crafter.new(:password => 'password').encrypted_password
      crafter.sign_in_count = 1
      crafter.delta = false
    end
  end

  desc 'delete all crafters'
  task :delete_all_crafters => :environment do
    [Crafter].each(&:delete_all)
  end

end
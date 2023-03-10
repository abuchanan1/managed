desc "Fill the database tables with some sample data"
task :sample_data => :environment do
  starting = Time.now

  Property.delete_all
  User.delete_all

  people = Array.new(20) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    }
  end

  people << { first_name: "Alice", last_name: "Smith" }
  people << { first_name: "Aaron", last_name: "Buchanan" }

  people.each do |person|
    username = person.fetch(:first_name).downcase

    user = User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
    )
    p user.errors.full_messages
  end

  users = User.all

  users.each do |user|
    rand(15).times do
      number = rand(1..100)
      property = user.own_properties.create(
        caption: Faker::Quote.jack_handey,
        image: "https://robohash.org/#{number}.png",
        address: Faker::Address.full_address,
        bedrooms: Faker::Number.between(from: 1, to: 5),
        bathrooms: Faker::Number.between(from: 1, to: 3),
        rent: Faker::Number.between(from: 1200, to: 4000),
        mortgage: Faker::Number.between(from: 1200, to: 4000),
        tenant_name: Faker::Name.name,
        tenant_phone: Faker::PhoneNumber.cell_phone
      )

      p property.errors.full_messages

    end
  end

  p "There are now #{User.count} users."
  p "There are now #{Property.count} properties."
end

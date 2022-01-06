puts "🌱 Seeding spices..."

Household.destroy_all
User.destroy_all
Pet.destroy_all
Task.destroy_all

house_names = ["Smith Family", "Li House", "Pet Paradise", "The Freemans", "Baty-Barr House", "So Animal Retreat", "The Hurley Feytser Cat Palace", "Casa de Snutz", "Our House", "Gamboa Family"]

i = 0

9.times do
    Household.create({
        household_name: house_names[i]
        })
    i = i + 1
end

20.times do
    
    User.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        household_id: Faker::Number.between(from: 1, to: 10)
        })
end

30.times do
    Pet.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: Faker::Number.between(from: 1, to: 10),
        species: Faker::Creature::Animal.name,
        household_id: Faker::Number.between(from: 1, to: 10)
        })
end

50.times do
    
    userid = Faker::Number.between(from: 1, to: 20)

    Task.create({
        user_id: userid,
        household_id: User.all.find(userid).household_id,
        pet_id: Faker::Number.between(from: 1, to: 30),
        task_name: Faker::Lorem.sentence(word_count: 3),
        task_due_date: Faker::Date.in_date_period,
        task_start_date: Faker::Date.in_date_period,
        task_is_recurring: Faker::Boolean.boolean,
        task_frequency: Faker::Number.between(from: 0, to: 365),
        task_end_date: Faker::Date.in_date_period,
        task_location: Faker::WorldCup.city
        })
end

puts "✅ Done seeding!"

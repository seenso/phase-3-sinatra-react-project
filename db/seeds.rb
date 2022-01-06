puts "🌱 Seeding spices..."

Household.destroy_all
User.destroy_all
Pet.destroy_all
Task.destroy_all

house_names = ["Smith Family", "Li House", "Pet Paradise", "The Freemans", "Baty-Barr House", "So Animal Retreat", "The Hurley Feytser Cat Palace", "Casa de Snutz", "Our House", "Gamboa Family"]

i = 0

10.times do
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

task_frequency_arr = [1,7,30,365]

50.times do
    
    userid = Faker::Number.between(from: 1, to: 20)
    recurring = Faker::Boolean.boolean
    last_day = Faker::Date.between(from: '2023-01-01', to: '2023-12-31')

    Task.create({
        user_id: userid,
        household_id: User.all.find(userid).household_id,
        pet_id: Faker::Number.between(from: 1, to: 30),
        task_name: Faker::Lorem.sentence(word_count: 3),
        task_due_date: last_day,
        task_start_date: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        task_is_recurring: recurring,
        task_frequency: recurring ? task_frequency_arr.sample : 0,
        task_end_date: last_day,
        task_location: Faker::WorldCup.city
        })
end

puts "✅ Done seeding!"

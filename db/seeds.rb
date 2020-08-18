Client.destroy_all
EventPlanner.destroy_all
Event.destroy_all
Client.reset_pk_sequence
EventPlanner.reset_pk_sequence
Event.reset_pk_sequence

########### different ways to write your seeds ############

def create_client

    client= Client.create(
        name: Faker::Name.name,
        phone_number: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email
    )
end

def create_event_planner

    title_name = ["Senior Event Planner", "Junior Event Planner"].sample
    event_planner= EventPlanner.create(
        name: Faker::Name.name_with_middle,
        phone_number: Faker::PhoneNumber.cell_phone,
        years_of_experience: rand(5..25),
        email: Faker::Internet.email,
        title: title_name
    )
end

10.times do 
    create_event_planner
end

def create_joiners(client)
        Event.create(
            event_name: Faker::Company.name,
            date: Faker::Date.in_date_period,
            location: Faker::Address.state,
            duration: rand(180..300),
            client_id: Client.all.sample.id,
            event_planner_id: EventPlanner.all.sample.id
        )
  end 

  10.times do 
    create_joiners(create_client)
  end


# 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
# basil = Plant.create(name: "basil the herb", bought: 20200610, color: "green")
# sylwia = Person.create(name: "Sylwia", free_time: "none", age: 30)
# pp1 = PlantParenthood.create(plant_id: basil.id, person_id: sylwia.id, affection: 1_000_000, favorite?: true)



# 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
## a. by passing an array of hashes:





# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}






# 3. Use Faker and mass create
## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end



## step 2: write a method that creates a joiner
# Why are we not passing event_planner in the argument
  

# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

## step 3: invoke creating joiners by passing in an instance of a person
# 
 
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


puts "🔥 🔥 🔥 🔥 "
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
require('pry-byebug')

Adoption.delete_all
Owner.delete_all
Animal.delete_all

owner1 = Owner.new({
  'name' => "Euan",
  'animals_owned' => 'None',
  'bio' => 'Euan is a student who has always wanted a dog',
  'capacity_for_animals' => 1,
  'looking_for' => 'Dog',
  'profile_picture' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/170px-Stick_Figure.svg.png'
})

owner2 = Owner.new({
  'name' => "Percy",
  'animals_owned' => 'Jerry',
  'bio' => 'Percy lives in a studio flat so would like a small animal',
  'capacity_for_animals' => 2,
  'looking_for' => 'Rat',
  'profile_picture' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/170px-Stick_Figure.svg.png'
})

# owner3 = Owner.new({
#   'name' => "Euan",
#   'animals_owned' => 'None',
#   'bio' => 'Euan is a student who has always wanted a dog',
#   'capacity_for_animals' => 1,
#   'looking_for' => 'Dog',
#   'profile_picture' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/170px-Stick_Figure.svg.png'
# })

# owner4 = Owner.new({
#   'name' => "Euan",
#   'animals_owned' => 'None',
#   'bio' => 'Euan is a student who has always wanted a dog',
#   'capacity_for_animals' => 1,
#   'looking_for' => 'Dog',
#   'profile_picture' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/170px-Stick_Figure.svg.png'
# })

owner1.save
owner2.save
# owner3.save
# owner4.save

animal1 = Animal.new({
  'name' => "Rufus",
  'type' => 'Dog',
  'breed' => 'Labrador',
  'bio' => 'Rufus is a friendly labrador',
  'ready_for_adoption' => true,
  'adopted' => false,
  'adoption_date' => 'N/A',
  'admission_date' => '12/02/2017',
  'profile_picture' => 'https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg'
})

animal2 = Animal.new({
  'name' => "Jerry",
  'type' => 'Mouse',
  'breed' => 'House Mouse',
  'bio' => 'Jerry is a crafty mouse',
  'ready_for_adoption' => false,
  'adopted' => true,
  'adoption_date' => '02/01/2016',
  'admission_date' => '03/12/2015',
  'profile_picture' => 'https://static.giantbomb.com/uploads/scale_small/0/5768/538236-jerry.jpg'
})

# animal3 = Animal.new({
#   'name' => "Rufus",
#   'type' => 'Dog',
#   'breed' => 'Labrador',
#   'bio' => 'Rufus is a friendly labrador',
#   'ready_for_adoption' => true,
#   'adopted' => false,
#   'adoption_date' => 'N/A',
#   'admission_date' => '12/02/2017',
#   'profile_picture' => 'https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg'
# })

# animal4 = Animal.new({
#   'name' => "Rufus",
#   'type' => 'Dog',
#   'breed' => 'Labrador',
#   'bio' => 'Rufus is a friendly labrador',
#   'ready_for_adoption' => true,
#   'adopted' => false,
#   'adoption_date' => 'N/A',
#   'admission_date' => '12/02/2017',
#   'profile_picture' => 'https://static.pexels.com/photos/7720/night-animal-dog-pet.jpg'
# })

animal1.save
animal2.save
# animal3.save
# animal4.save

adoption1 = Adoption.new({
  'animal_id' => animal1.id,
  'owner_id' => owner1.id
})

adoption1.save

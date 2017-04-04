require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
require('pry-byebug')

Adoption.delete_all
Owner.delete_all
Animal.delete_all

owner1 = Owner.new({
  'name' => "Terry",
  'animals_owned' => ' ',
  'bio' => 'Terry is a dog enthusiast',
  'capacity_for_animals' => 1,
  'looking_for' => 'Dog',
  'profile_picture' => '/images/terry.jpg'
})

owner2 = Owner.new({
  'name' => "Percy",
  'animals_owned' => ' ',
  'bio' => 'Percy loves cats',
  'capacity_for_animals' => 2,
  'looking_for' => 'Cat',
  'profile_picture' => '/images/percy.jpg'
})

owner3 = Owner.new({
  'name' => "Jemima",
  'animals_owned' => ' ',
  'bio' => 'Jemima has lots of cats and is looking for more. Jemima has a problem.',
  'capacity_for_animals' => 6,
  'looking_for' => 'Cat',
  'profile_picture' => '/images/jemima.jpg'
})

owner1.save
owner2.save
owner3.save

animal1 = Animal.new({
  'name' => "Rufus",
  'type' => 'Dog',
  'breed' => 'Labrador',
  'bio' => 'Rufus is a friendly labrador',
  'ready_for_adoption' => "Yes",
  'adopted' => "No",
  'adoption_date' => "",
  'admission_date' => "2017-02-12",
  'profile_picture' => '/images/rufus.jpg'
})

animal2 = Animal.new({
  'name' => "Clarence",
  'type' => 'Cat',
  'breed' => 'Tom',
  'bio' => 'Clarence is a lazy cat',
  'ready_for_adoption' => "No",
  'adopted' => "No",
  'adoption_date' => "",
  'admission_date' => "2015-12-03",
  'profile_picture' => '/images/clarence.jpg'
})

animal3 = Animal.new({
  'name' => "Doug",
  'type' => 'Dog',
  'breed' => 'Pug',
  'bio' => 'Doug is a pug',
  'ready_for_adoption' => "Yes",
  'adopted' => "No",
  'adoption_date' => "",
  'admission_date' => "2014-08-13",
  'profile_picture' => '/images/doug.jpg'
})

animal4 = Animal.new({
  'name' => "Pierre",
  'type' => 'Cat',
  'breed' => 'Siamese',
  'bio' => 'Pierre is a Siamese cat of unclear origin',
  'ready_for_adoption' => "Yes",
  'adopted' => "No",
  'adoption_date' => "",
  'admission_date' => "2017-02-12",
  'profile_picture' => '/images/pierre.jpg'
})

animal1.save
animal2.save
animal3.save
animal4.save

nil

# adoption1 = Adoption.new({
#   'animal_id' => animal2.id,
#   'owner_id' => owner2.id
# })

# adoption2 = Adoption.new({
#   'animal_id' => animal3.id,
#   'owner_id' => owner3.id
# })

# adoption1.save
# adoption2.save

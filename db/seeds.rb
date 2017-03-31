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
  'adoption_date' => 'N/A',
  'bio' => 'Euan is a student who has always wanted a dog',
  'capacity_for_animals' => 1,
  'looking_for' => 'Dog',
  'profile_picture' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/170px-Stick_Figure.svg.png'
})

owner1.save

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

animal1.save

adoption1 = Adoption.new({
  'animal_id' => animal1.id,
  'owner_id' => owner1.id
})

adoption1.save

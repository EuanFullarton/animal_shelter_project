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
  'animals_owned' => 'None',
  'bio' => 'Percy loves cats',
  'capacity_for_animals' => 2,
  'looking_for' => 'Cat',
  'profile_picture' => 'http://pix.iemoji.com/images/emoji/apple/ios-9/256/white-older-man.png'
})

owner3 = Owner.new({
  'name' => "Jemima",
  'animals_owned' => 'None',
  'bio' => 'Jemima owns a farm and is looking for several animals',
  'capacity_for_animals' => 6,
  'looking_for' => 'Cat',
  'profile_picture' => 'https://thumbs.dreamstime.com/x/female-farmer-holding-pitchfork-bucket-20260568.jpg'
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
  'adoption_date' => "N/A",
  'admission_date' => "2017-02-12",
  'profile_picture' => 'https://is3-ssl.mzstatic.com/image/thumb/Purple20/v4/4b/9f/1f/4b9f1f55-149e-d720-9c18-47a4657813dd/source/256x256bb.jpg'
})

animal2 = Animal.new({
  'name' => "Clarence",
  'type' => 'Cat',
  'breed' => 'Tom',
  'bio' => 'Clarence is a lazy cat',
  'ready_for_adoption' => "No",
  'adopted' => "No",
  'adoption_date' => "2016-01-02",
  'admission_date' => "2015-12-03",
  'profile_picture' => 'https://pbs.twimg.com/profile_images/710983778802409472/EdOHlXdK.jpg'
})

animal3 = Animal.new({
  'name' => "Doug",
  'type' => 'Dog',
  'breed' => 'Pug',
  'bio' => 'Doug is a pug',
  'ready_for_adoption' => "Yes",
  'adopted' => "No",
  'adoption_date' => "2014-10-03",
  'admission_date' => "2014-08-13",
  'profile_picture' => 'https://pbs.twimg.com/profile_images/662398361971105792/SOGHt_tL.jpg'
})

animal4 = Animal.new({
  'name' => "Pierre",
  'type' => 'Cat',
  'breed' => 'Siamese',
  'bio' => 'Pierre is a Siamese cat of unclear origin',
  'ready_for_adoption' => "Yes",
  'adopted' => "No",
  'adoption_date' => "N/A",
  'admission_date' => "2017-02-12",
  'profile_picture' => 'http://siamesebreedersgroup.weebly.com/uploads/5/2/7/0/5270013/8451140.jpg?256'
})

animal1.save
animal2.save
animal3.save
animal4.save

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

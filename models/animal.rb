require_relative ('../db/sql_runner')
require_relative ('../models/adoption')

class Animal

  attr_reader(:id, :name, :type, :breed, :bio, :ready_for_adoption, :adopted, :adoption_date, :admission_date, :profile_picture) 

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @bio = options['bio']
    @ready_for_adoption = options['ready_for_adoption']
    @adopted = options['adopted']
    @adoption_date = options['adoption_date']
    @admission_date = options['admission_date']
    @profile_picture = options['profile_picture']

  end

  def save()
    sql = "INSERT INTO animals 
    (name, type, breed, bio, ready_for_adoption, adopted, adoption_date, admission_date, profile_picture)
    VALUES 
    ('#{@name}',
    '#{@type}',
    '#{@breed}',
    '#{@bio}',
    '#{@ready_for_adoption}',
    '#{@adopted}',
    '#{@adoption_date}',
    '#{@admission_date}',
    '#{@profile_picture}')
    RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def edit()
    sql = "UPDATE animals SET
    name = '#{@name}',
    type = '#{@type}',
    breed = '#{@breed}',
    bio = '#{@bio}',
    ready_for_adoption = '#{@ready_for_adoption}',
    adopted = '#{@adopted}',
    adoption_date = '#{@adoption_date}',
    admission_date = '#{@admission_date}',
    profile_picture = '#{@profile_picture}'
    WHERE id = '#{@id}'"
    SqlRunner.run(sql)
  end

  def owner()
    sql = "SELECT owners.* FROM owners INNER JOIN adoptions ON adoptions.owner_id = owners.id WHERE adoptions.animal_id = #{@id}"
    owner = SqlRunner.run(sql)
    return owner.first
  end

  def adopt()
    @adopted = "Yes"
  end

  def return_to_shelter()
    @adopted = "No"
    @ready_for_adoption = "Yes"
  end

  def unavailable()
    @ready_for_adoption = " " 
  end

  def adoption()
    sql = "SELECT * FROM adoptions WHERE animal_id = #{@id}"
    results = SqlRunner.run(sql)
    return Animal.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = #{id}"
    animal = SqlRunner.run(sql)
    result = Animal.new(animal.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    result = animals.map { |animal| Animal.new(animal) }
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM animals WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

end
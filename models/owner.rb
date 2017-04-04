require_relative ('../db/sql_runner')

class Owner

  attr_reader(:id, :name, :animals_owned, :bio, :capacity_for_animals, :looking_for, :profile_picture) 


  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @animals_owned = options['animals_owned']
    @bio = options['bio']
    @capacity_for_animals = options['capacity_for_animals'].to_i
    @looking_for = options['looking_for']
    @profile_picture = options['profile_picture']
  end

  def save()
    sql = "INSERT INTO owners 
    (name, animals_owned, bio, capacity_for_animals, looking_for, profile_picture)
    VALUES 
    ('#{@name}',
    '#{@animals_owned}',
    '#{@bio}',
    '#{@capacity_for_animals}',
    '#{@looking_for}',
    '#{@profile_picture}')
    RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def edit()
    sql = "UPDATE owners SET
    name = '#{@name}',
    animals_owned = '#{@animals_owned}',
    bio = '#{@bio}',
    capacity_for_animals = '#{@capacity_for_animals}',
    looking_for = '#{@looking_for}',
    profile_picture = '#{@profile_picture}'
    WHERE id = '#{@id}'"
    SqlRunner.run(sql)
  end

  def capacity()
    @capacity_for_animals -= 1
  end

  def more_space()
    @capacity_for_animals += 1
  end

  # def owned_animal()
  # end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = #{id}"
    owner = SqlRunner.run(sql)
    result = Owner.new(owner.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    result = owners.map { |owner| Owner.new(owner) }
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM owners WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

end
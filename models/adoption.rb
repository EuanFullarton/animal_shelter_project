require_relative( '../db/sql_runner' )

class Adoption

  attr_reader(:id, :animal_id, :owner_id) 

  def initialize( options )
    @id = options['id'].to_i
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id) 
          VALUES (#{@animal_id},#{@owner_id}) 
          RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def animal()
    sql = "SELECT * FROM animals
          INNER JOIN adoptions
          ON adoptions.animal_id = animals.id
          WHERE animals.id = #{@animal_id}"
    results = SqlRunner.run(sql)
    return Animal.new( results.first )
  end

  def owner()
    sql = "SELECT * FROM owners
          INNER JOIN adoptions
          ON adoptions.owner_id = owners.id
          WHERE owners.id = #{@owner_id}"
    results = SqlRunner.run( sql )
    return Owner.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map {|adoption| Adoption.new(adoption)}
  end

  def self.delete(id)
    sql = "DELETE FROM adoptions WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.delete_all
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

end
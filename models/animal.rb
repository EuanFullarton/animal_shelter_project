require_relative ('../db/sql_runner')

class Animal

  def initialize (options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @bio = options['bio']
    @ready_for_adoption = options['ready_for_adoption']
    @adopted = options['adopted']
    @adoption_date['adoption_date']
    @admission_date['admission_date']
    @profile_picture['profile_picture']

  end

  def save()
    sql = "INSERT INTO animals 
    (name, type, breed, bio, ready_for_adoption, adopted, adoption_date, admission_date, profile_picture)
    VALUES 
    ('#{@name}', '#{@type}', '#{@breed}', '#{@bio}', '#{@ready_for_adoption}', '#{@adopted}', '#{@adoption_date}', '#{@admission_date}', '#{@profile_picture}')
    RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def edit()
    sql = "UPDATE animals SET
    name = '#{@name}'
    type = '#{@type}'
    breed = '#{@breed}'
    bio = '#{@bio}'
    ready_for_adoption = '#{@ready_for_adoption}'
    adopted = '#{@adopted}'
    adoption_date = '#{@adoption_date}'
    admission_date = '#{@admission_date}'
    profile_picture = '#{@profile_picture}'
    WHERE id = '#{@id}'"
    SqlRunner.run(sql)
  end


end
class Contact
  attr_accessor :name, :age, :email
  attr_reader :id

  def initialize(id, name, age, email)
    @id = id
    @name = name
    @age = age
    @email = email
  end

  def print
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "Age: #{@age}"
    puts "Email: #{@email}"
  end
end




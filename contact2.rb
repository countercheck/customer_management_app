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
    puts "Press any key to continue"
    gets
  end

  def modify_name
    puts "Current name is #{@name}.  Please enter new name."
    @name = gets.chomp
    contact
  end

  def modify_age
    puts "Current age is #{@age}.  Please enter new age."
    @age = gets.chomp
    contact
  end

  def modify_email
    puts "Current email is #{@email}.  Please enter new e-mail."
    @email = gets.chomp
    contact
  end
end

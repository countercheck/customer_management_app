class Contact
  attr_accessor :name, :age, :email, :notes
  attr_reader :id

  def initialize(id, contact_info)
    @id = id
    @name = contact_info[:name]
    @age = contact_info[:age]
    @email = contact_info[:email]
    @notes = contact_info[:notes]
  end

  def print
    puts "ID: #{@id}"
    puts "Name: #{@name}"
    puts "Age: #{@age}"
    puts "Email: #{@email}"
    puts "Notes: #{@notes}"
  end

end

require_relative 'contact'

class Rolodex
  def initialize
    @contacts = []
    @id = 1000
  end
  
  def new_contact
    puts "What is your contact's name?"
    name = gets.chomp

    puts "What is your contact's age?"
    age = gets.chomp.to_i

    puts "What is your contact's e-mail"
    email = gets.chomp

    @id += 1
    @contacts << Contact.new(@id, name, age, email)

    puts "#{@contacts.last.name} has been added to your rolodex."
    @contacts.last
  end

  def find_id
    if @contacts.empty?
      puts "You have no contacts in your Rolodex."
      return nil
    end

    puts "Enter the #ID of contact you wish to find.  If you don't know the #ID, run a search for whatever you do know about them (name, e-mail, age)."
    id = gets.chomp.to_i
    
    i=0
    @contacts.each do |contact|
      return contact if contact.id == id
      i+=1
    end

    puts "I'm sorry, I couldn't find a contact with that ID.  Maybe searching for the contact's name or e-mail would help?"
  end  

  def modify_name(contact)
    puts "Current name is #{contact.name}.  Please enter new name."
    contact.name = gets.chomp
    contact
  end

  def modify_age(contact)
    puts "Current age is #{contact.age}.  Please enter new age."
    contact.age = gets.chomp
    contact
  end

  def modify_email(contact)
    puts "Current email is #{contact.email}.  Please enter new e-mail."
    contact.email = gets.chomp
    contact
  end

  def delete(contact)
    @contacts.delete(contact)
  end
end

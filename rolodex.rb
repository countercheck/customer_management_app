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
  end

  def find_id
    if @contacts.empty?
      puts "You have no contacts in your Rolodex."
      return nil
    end

    puts "Enter the ID of the entry you wish to view or modify."
    id = gets.chomp.to_i
    
    i=0
    @contacts.each do |contact|
      return {object: contact, index: i} if contact.id == id
      i+=1
    end
  end  
end

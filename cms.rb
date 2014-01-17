require_relative 'contact'
require_relative 'rolodex'

class CMS
  def initialize
    @rolodex = Rolodex.new
  end
  
  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def main_menu
    print_main_menu
    selection = gets.chomp.to_i
    call_option(selection)
  end
  
  def call_option(selection)
    case selection
    when 1 then new_contact

      
    end
    
  end

  def new_contact
    puts "What is your contact's name?"
    name = gets.chomp
    age = false
    puts "What is your contact's age?"
    age = gets.chomp.to_i
    puts "What is your contact's e-mail"
    email = gets.chomp
    contact = @rolodex.new_contact(name, age, email)
    puts "#{contact.name} has been added to your rolodex."
  end
end

cms =CMS.new
cms.main_menu
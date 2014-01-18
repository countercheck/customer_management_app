require_relative 'contact'
require_relative 'rolodex'

class CMS
  def initialize
    @rolodex = Rolodex.new
  end
  
  def main_menu
    puts "[1] Add a new contact"
    puts "[2] Find a contact by their ID"
    puts "[3] Delete a contact"
    puts "[3] Filter contacts by attribute"
    puts "[4] Exit"
    puts "Enter a number: "

    selection = gets.chomp.to_i
    call_option(selection)
  end
  
  def call_option(selection)
    case selection
    when 1 then @rolodex.new_contact
    when 2 then find_id
    when 4 then return

      
    end
    main_menu
  end

  def find_id
    contact = @rolodex.find_id
    puts "ID: #{contact[:object].id}"
    puts "Name: #{contact[:object].name}"
    puts "Age: #{contact[:object].age}"
    puts "Email: #{contact[:object].email}"
  end
end
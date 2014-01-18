require_relative 'contact'
require_relative 'rolodex'

class CMS
  def initialize
    @rolodex = Rolodex.new
  end
  
  def main_menu
    puts "[1] Add a new contact"
    puts "[2] Find a contact by their ID"
    puts "[3] Modify a contact"
    puts "[3] Delete a contact"
    puts "[3] Filter contacts by attribute"
    puts "[4] Exit"
    puts "Enter a number: "

    selection = gets.chomp.to_i
    menu_option(selection)
  end
  
  def menu_option(selection)
    case selection
    when 1 then @rolodex.new_contact
    when 2 then find_id
    when 3 then modify
    when 4 then return

      
    end
    main_menu
  end

  def find_id
    puts "Enter the ID of the entry."
    contact = @rolodex.find_id
    contact.print
    contact
  end

  def modify
    contact = find_id

    puts "[1] Modify name"
    puts "[2] Modify age"
    puts "[3] Modify e-mail"
    puts "Choose a number"
    selection = gets.chomp.to_i

    case selection
    when 1 then @rolodex.modify_name contact
    when 2 then @rolodex.modify_age contact
    when 3 then @rolodex.modify_email contact
    when 4 then return
    end
    
    contact.print
    contact
  end

end

cms = CMS.new
cms.main_menu
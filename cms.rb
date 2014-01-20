require_relative 'contact'
require_relative 'rolodex'

class CMS
  def initialize
    @rolodex = Rolodex.new
  end
  
  def main_menu
    selection = 0
    while selection != 6
      puts "[1] Add a new contact"
      puts "[2] Find a contact by their ID"
      puts "[3] Modify a contact"
      puts "[4] Delete a contact"
      puts "[5] Search contacts by name, age, or e-mail address"
      puts "[6] Exit"
      puts "Enter a number: "

      selection = gets.chomp.to_i

      case selection
      when 1 then @rolodex.new_contact
      when 2 then find_id
      when 3 then modify
      when 4 then delete
      when 6 then return
      else puts "I'm sorry, I didn't understand.  Could you try to make your selection again?"
      end
    end
  end

  def find_id
    contact = @rolodex.find_id
    return unless contact
    contact
  end

  def modify
    contact = find_id
    return unless contact

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
    else puts "I'm sorry, I didn't understand that."
    end
    
    contact.print
    contact

  end

  def delete

    contact = find_id
    return unless contact

    puts "Do you really want to delete entry #{contact.id}: #{contact.name}?"
    puts "Y/N"
    selection = gets.chomp.upcase
    return if selection == "N"

    @rolodex.delete contact
    
  end

  def search
    puts "[1] I want to search contacts by name"
    puts "[2] I want to search contacts by age"
    puts "[3] I want to search contacts by name"
    puts "[4] I came here by mistake, take me back to main menu"
    selection = gets.chomp.to_i

    case selection
    when 1 then @rolodex.search_name contact
    when 2 then @rolodex.search_age contact
    when 3 then @rolodex.search_email contact
    when 4 then return
    else puts "I'm sorry, I didn't understand that."
    end

  end

end

cms = CMS.new
cms.main_menu

load 'rolodex2.rb'
contact = {name: "Emilie Brancato", age: 29, email: "emmi.anne@gmail.com"}
rolo = Rolodex.new
rolo.new_contact(contact)
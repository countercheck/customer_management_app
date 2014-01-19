require_relative 'contact2'
require_relative 'rolodex2'

class CMS
  attr_accessor :rolodex
  def initialize
    @rolodex = Rolodex.new
  end
  
  def main_menu
    selection = 0
    while selection != 3
      puts "[1] Add a new contact"
      puts "[2] Find a contact"
      puts "[3] Exit \n"
      puts "Enter a number: "

      selection = gets.chomp.to_i

      case selection
      when 1 then new_contact
      when 2 then #find a contact
      when 3 then puts "Thanks for trying me out!"
      else puts " \n I'm sorry, I didn't understand.  Could you try to make your selection again?\n"
      end
    end
  end

  def new_contact
    contact_info = {}
    puts "What is your contact's name?"
    contact_info[:name] = gets.chomp.upcase

    puts "What is your contact's age?"
    contact_info[:age] = gets.chomp

    puts "What is your contact's e-mail"
    contact_info[:email] = gets.chomp.upcase

    contact = @rolodex.new_contact(contact_info)

    puts "#{contact.name} has been added to your rolodex."
  end

  # def find_id
  #   contact = @rolodex.find_id
  #   return unless contact
  #   contact
  # end

  # def modify
  #   contact = find_id
  #   return unless contact

  #   puts "[1] Modify name"
  #   puts "[2] Modify age"
  #   puts "[3] Modify e-mail"
  #   puts "Choose a number"
  #   selection = gets.chomp.to_i

  #   case selection
  #   when 1 then @rolodex.modify_name contact
  #   when 2 then @rolodex.modify_age contact
  #   when 3 then @rolodex.modify_email contact
  #   when 4 then return
  #   else puts "I'm sorry, I didn't understand that."
  #   end
    
  #   contact.print
  #   contact

  # end

  # def delete

  #   contact = find_id
  #   return unless contact

  #   puts "Do you really want to delete entry #{contact.id}: #{contact.name}?"
  #   puts "Y/N"
  #   selection = gets.chomp.upcase
  #   return if selection == "N"

  #   @rolodex.delete contact
    
  # end

  # def search
  #   puts "[1] I want to search contacts by name"
  #   puts "[2] I want to search contacts by age"
  #   puts "[3] I want to search contacts by name"
  #   puts "[4] I came here by mistake, take me back to main menu"
  #   selection = gets.chomp.to_i

  #   case selection
  #   when 1 then @rolodex.search_name contact
  #   when 2 then @rolodex.search_age contact
  #   when 3 then @rolodex.search_email contact
  #   when 4 then return
  #   else puts "I'm sorry, I didn't understand that."
  #   end

  # end

end

cms = CMS.new
cms.main_menu

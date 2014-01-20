require_relative 'contact'
require_relative 'rolodex'

class CMS
  attr_accessor :rolodex
  def initialize
    @rolodex = Rolodex.new
  end
  
  def main_menu
    selection = 1
    while selection != 0
      puts "[1] Add a new contact"
      puts "[2] Search rolodex for an existing contact"
      puts "[3] Modify an existing contact"
      puts "[4] Delete an existing contact"
      puts "[0] Exit \n"
      puts "Enter a number: "

      selection = gets.chomp.to_i

      case selection
      when 1 then new_contact
      when 2 then search_contact
      when 3 then modify
      when 4 then delete
      when 0 then puts "Thanks for trying me out!"
      else puts " \n I'm sorry, I didn't understand.  Could you try to make your selection again?\n"
      end
    end
  end

  def new_contact
    contact_info = {}
    puts "\nWhat is your contact's name?"
    contact_info[:name] = gets.chomp.upcase

    puts "\nWhat is your contact's age?"
    contact_info[:age] = gets.chomp

    puts "\nWhat is your contact's e-mail?"
    contact_info[:email] = gets.chomp.upcase

    puts "\nAny notes about this contact you'd like to add? Press enter if you'd like to skip."
    contact_info[:notes] = gets.chomp.upcase

    contact = @rolodex.new_contact(contact_info)
    contact.print

    puts "\n #{contact.name} has been added to your rolodex.\n"

  end

  def search_contact
    puts "\n[1] I know the contact's #ID"
    puts "[2] I know some or all of the contact's name"
    puts "[3] I know the contact's age"
    puts "[4] I know some or all of the contact's e-mail address"
    puts "[5] I know some or all of the information in the notes section of the contact"
    puts "[0] Return to main menu"
    puts "Please enter the appropriate number"
    selection = gets.chomp.to_i

    case selection
    when 1
      field = :id
      puts "\nPlease input the contacts ID like this: 1001"
    when 2
      field = :name
      puts "Please enter part or all of the contact's name"
    when 3
      field = :age
      puts "\nPlease enter the contact's  age"
    when 4
      field = :email
      puts "\nPlease enter part or all of the contact's  e-mail address"
    when 5
      field = :notes
      puts "\nPlease a distinctive word or phrase contained in the contact's notes"
    when 0 then return
    else
      puts "\nI didn't understand that.  Return to main menu"
      return
    end

    value = gets.chomp
    value = ( field == :id || field == :age ? value.to_i : value.upcase)
    @selected_contacts = @rolodex.search(field, value)

    if @selected_contacts == 0
      puts "Your contact list is empty."
      return
    elsif @selected_contacts == 1 
      puts "I didn't find any matches"
      return
    else
      @rolodex.display(@selected_contacts)
      selection_menu
    end
  end

  def selection_menu
    selection = 1
    while selection != 0 
      puts "[1] I want to modify a contact"
      puts "[2] I want to delete a contact"
      puts "[3] I want to sort the search results."
      puts "[4] I want to try a new search."
      puts "[0] Back to main menu"
      puts "Please enter a number"
      
      selection = gets.chomp.to_i
      case selection
      when 1 then modify
      when 2 then delete
      when 3 then sort_list
      when 4 then search_contact
      when 0 then return  
      else puts "I didn't understand that" 
      end
    end
  end

  def sort_list
    selection = 1
    while selection != 0
      puts "How would you like the search results sorted?"
      puts "[1] By name"
      puts "[2] By age"
      puts "[3] By e-mail address"
      puts "[0] Back to previous menu"
      puts "Enter a number"

      selection = gets.chomp.to_i
      case selection
      when 1 then field = :name
      when 2 then field = :age 
      when 3 then field = :email
      when 0 then return
      end

      @selected_contacts.sort_by!{|contact| @rolodex.read(contact, field)}
      @rolodex.display(@selected_contacts)
    end
  end

  def modify
    selection = 1
    while selection != 0
      puts "Input the #ID of contact you wish to modify"
      id = gets.chomp.to_i
      contact = @rolodex.search(:id, id)
      contact[0].print

      puts "[1] Modify name"
      puts "[2] Modify age"
      puts "[3] Modify e-mail"
      puts "Choose a number"
      selection = gets.chomp.to_i
      
      case selection
      when 1 then field = :name= 
      when 2 then field = :age=
      when 3 then field = :email=
      when 4 then field = :notes=
      when 0 then return
      else puts "I'm sorry, I didn't understand that."
      end

      puts "Input the new #{field}"
      value = gets.chomp
      value = value.to_i if field == :age
      @rolodex.modify(contact[0], field, value)
      contact[0].print
      return
    end
  end

  def delete
    puts "Input the #ID of contact you wish to delete"
    id = gets.chomp.to_i
    contact = @rolodex.search(:id, id)
    contact[0].print

    puts "Do you really want to delete this entry? Y/N"
      
    selection = gets.chomp.upcase
    return if selection == "N"

    @rolodex.delete contact[0]

  end
end
  

cms = CMS.new
cms.main_menu
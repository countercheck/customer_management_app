require_relative 'contact'

class Rolodex
  def initialize
    @contacts = []
    @id = 1000
  end
  
  def new_contact(name, age, email)
    @id += 1

    @contacts << Contact.new(@id, name, age, email)
    @contacts.last
  end

  def find_id(id)
    return nil if @contacts.empty?
      
    @contacts.each do |contact|
      return contact if contact.id == id
    end
  end  
end
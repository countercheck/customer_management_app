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
    
    i=0
    @contacts.each do |contact|
      return {object: contact, index: i} if contact.id == id
      i+=1
    end
  end  
end

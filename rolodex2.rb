require_relative 'contact2'

class Rolodex

  attr_accessor :contacts

  def initialize
    @contacts = []
    @id = 1000
  end

  #accepts a hash named contact_info(:name :age :email)
  def new_contact(contact_info) 
    @id += 1
    @contacts << Contact.new(@id, contact_info)
    @contacts.last
  end

  def modify(contact, field, new_value)
    contact.send(field, new_value)
    contact
  end

  def delete(contact)
    @contacts.delete(contact)
  end

  #returns 0 if contacts.empty?, 1 if contact not found, contact if contact found.

  def search(value, field)
   return 0 if @contacts.empty?
    filtered_contacts = []
    comparison = ( value.class == Fixnum ? :eql? : :include? )
    @contacts.each do |contact|
      if contact.send(field).send(comparison, value)
        filtered_contacts << contact
        return filtered_contacts if field == :id
      end
    end
    return filtered_contacts unless filtered_contacts.empty?

    return 1
  end
end
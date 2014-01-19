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

  def modify(contact, method, new_value)
    contact.send(method, new_value)
    contact
  end

  def delete(contact)
    @contacts.delete(contact)
  end

  #returns 0 if contacts.empty?, 1 if contact not found, contact if contact found.
  def find_id(id)
    return 0 if @contacts.empty?
    @contacts.each { |contact|
      return contact if contact.id == id }
    return 1
  end

  def search(attribute, method)
    filtered_contacts = []
    
    @contacts.each do |contact|
      filtered_contacts << contact if contact.send(method).include? attribute
    end

    filtered_contacts
  end
end
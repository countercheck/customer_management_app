require_relative 'contact2'

class Rolodex

  attr_accessor :contacts

  def initialize
    @contacts = []
    @id = 1000
  end

  #accepts a hash named contact_hash(:name :age :email)
  def new_contact(contact_hash) 
    @id += 1
    @contacts << Contact.new(@id, contact_hash[:name], contact_hash[:age], contact_hash[:email])
    @contacts.last
  end

  def modify_name(contact, new_name)
    contact.name = new_name
    contact
  end

  def modify_age(contact, new_age)
    contact.age = new_age
    contact
  end

  def modify_email(contact, new_email)
    contact.email = new_email
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


end

contact = {name: "Emilie", age: "29", email: "emmi.ann@gmail.com"}
rolo = Rolodex.new
rolo.new_contact(contact)
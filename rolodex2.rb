require_relative 'contact2'

class Rolodex
  def initialize
    @contacts = []
    @id = 1000
  end

  #accepts a hash named contact(:name :age :email)
  def new_contact(contact) 
    @id += 1
    @contacts << Contact.new(@id, contact[:name], contact[:age], contact[:email])
    @contacts.last
  end
end
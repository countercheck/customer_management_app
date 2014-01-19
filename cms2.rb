require_relative 'contact'
require_relative 'rolodex'

class CMS
  def initialize
    @rolodex = Rolodex.new
  end
end
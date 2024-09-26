class Modified
  attr_accessor :id, :name, :birth_date, :email, :phone_number

  def initialize(id, name, birth_date, email, phone_number)
    @id = id
    @name = name
    @birth_date = birth_date
    @phone_number = phone_number
    @email = email
  end

  def display
    "ID: #{id}, Name: #{name}, Birth Date: #{birth_date}, Email: #{email}, Phone: #{phone_number}"
  end
end

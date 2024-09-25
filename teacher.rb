class Teacher
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :department
  @@record = []

  def initialize(id, name, birth_date, email, phone_number, department)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @department = department
  end

  def save
    @@record << self
  end

  def destroy
    @@record.delete(self)
  end

  def display
    print "ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone number: #{phone_number}, Department: #{department}"
  end

  def self.all
    @@record
  end

  def self.find_by_id(id)
    @@record.find { |teacher| teacher.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |teacher| teacher.email == email }
  end
end
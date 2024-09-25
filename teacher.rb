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
    existing_teacher = self.class.find_by_id(self.id)
    if existing_teacher
      existing_teacher.name = self.name
      existing_teacher.email = self.email
      existing_teacher.phone_number = self.phone_number
      existing_teacher.department = self.department
      puts "Teacher updated successfully!"
    else
      @@record << self
      puts "Teacher added successfully!"
    end
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    print "Teacher ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone number: #{phone_number}, Department: #{department}"
  end

  def self.display_all
    all.each do |teacher|
      puts "Teacher ID: #{teacher.id}, Name: #{teacher.name}, Email: #{teacher.email}, Phone: #{teacher.phone_number}, Department: #{teacher.department}"
    end
  end

  def self.all
    @@record.select { |teacher| teacher.deleted_at.nil? }
  end

  def self.find_by_id(id)
    @@record.find { |teacher| teacher.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |teacher| teacher.email == email }
  end
end
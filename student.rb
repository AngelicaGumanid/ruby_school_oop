class Student
    attr_accessor :id, :name, :birth_date, :email, :phone_number
    @@record = []

    def initialize(id, name, birth_date, email, phone_number)
        @id = id
        @name = name
        @birth_date = birth_date
        @email = email
        @phone_number = phone_number
    end

    def save
        @@record << self
    end

    def destroy
        @@record.delete(self)
    end

    def display
        print "ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone number: #{phone_number}"
    end

    def self.all
        @@record
    end

    def self.find(id)
        @@record.find { |student| student.id == id}
    end

    def self.find_by_email(email)
        @@record.find { |student| student.email == email}
    end
end
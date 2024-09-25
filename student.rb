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
        existing_student = self.class.find_by_id(self.id)
        if existing_student
            existing_student.name = self.name
            existing_student.email = self.email
            existing_student.phone_number = self.phone_number
            puts "Student updated successfully!"
        else
            @@record << self
            puts "Student added successfully!"
        end
    end

    def destroy
        self.deleted_at = Time.now
    end

    def display
        print "Student ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone number: #{phone_number}"
    end

    def self.display_all
        all.each do |student|
          puts "Student ID: #{student.id}, Name: #{student.name}, Email: #{student.email}, Phone: #{student.phone_number}"
        end
    end

    def self.all
        @@record.select { |student| student.deleted_at.nil? }
    end

    def self.find(id)
        @@record.find { |student| student.id == id}
    end

    def self.find_by_email(email)
        @@record.find { |student| student.email == email}
    end
end
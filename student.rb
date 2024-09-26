 class Student
    attr_accessor :id, :name, :birth_date, :email, :phone_number, :course_id, :deleted_at
    @@record = []

    def initialize(id, name, birth_date, email, phone_number, course_id)
        @id = id
        @name = name
        @birth_date = birth_date
        @email = email
        @phone_number = phone_number
        @course_id = course_id
        @deleted_at = nil
    end

    def save
        existing_student = self.class.find_by_id(self.id)
        if existing_student
            existing_student.name = self.name
            existing_student.email = self.email
            existing_student.phone_number = self.phone_number
            existing_student.course_id = self.course_id
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
        course = Course.find_by_id(self.course_id)
        course_name = course ? course.name : "None"
        print "Student ID: #{id}, Name: #{name}, Birthdate: #{birth_date}, Email: #{email}, Phone number: #{phone_number}, Course: #{course.name if course} "
    end

    def self.display_all
        all.each do |student|
            course = Course.find_by_id(student.course_id)
            course_name = course ? course.name : "None"
            puts "Student ID: #{student.id}, Name: #{student.name}, Email: #{student.email}, Phone: #{student.phone_number}, Course: #{course.name if course}"
        end
    end

    def self.all
        @@record.select { |student| student.deleted_at.nil? }
    end

    def self.find_by_id(id)
        @@record.find { |student| student.id == id}
    end

    def self.find_by_email(email)
        @@record.find { |student| student.email == email}
    end
end
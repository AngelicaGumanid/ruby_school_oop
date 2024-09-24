require_relative 'student'

def add_student
    id = Student.all.size + 1

    puts "=================================================="
    puts "CREATING NEW STUDENT"

    print "Enter Full Name: "
    name = gets.chomp

    print "Birth Date: "
    birth_date = gets.chomp

    print "Enter Email: "
    grade = gets.chomp

    print "Enter Phone Number: "
    address = gets.chomp

    student = Student.new(id, name, birth_date, grade, address)
    student.save

    puts "=================================================="
    puts student.display
    puts "STUDENT ADDED SUCCESSFULLY"
end
require_relative 'student'

# ================================================== STUDENT MANAGEMENT ==================================================
def add_student # ----- Add student -----
    student_id = Student.all.size + 1

    puts "\n=================================================="
    puts "CREATING NEW STUDENT RECORD\n"

    print "Enter Full Name: "
    name = gets.chomp

    print "Birth Date: "
    birth_date = gets.chomp

    print "Enter Email: "
    email = gets.chomp

    print "Enter Phone Number: "
    phone_number = gets.chomp

    student = Student.new(student_id, name, birth_date, email, phone_number)
    student.save

    puts "==================================================\n\n"
    puts student.display
    puts "\nSTUDENT ADDED SUCCESSFULLY"
end

def delete_student # ----- Delete student -----
    puts "\n=================================================="
    puts "DELETE A STUDENT RECORD\n"

    print "Enter Student ID to delete: "
    id = gets.chomp.to_i
    student = Student.find(id)

    if student
        puts "\nStudent ID: #{student.id}"
        puts "Name: #{student.name}"
        puts "Birthdate: #{student.birth_date}"
        puts "Email: #{student.email}"
        puts "Phone Number #{student.phone_number}\n"
        puts "=================================================="
        print "\nAre you sure you want to delete? (y/n):  "
        action = gets.chomp

        if action.downcase == 'y'
            student.destroy
            puts "\nStudent destroyed successfully.\n"
        end
    else
        puts "\nStudent not found."
    end
end

loop do # ----- student management -----
    system("clear")
    puts "\n======================================================================"
    puts "Choose a number to correspond to the action you want:"
    puts "[1] Add Student Information"
    puts "[2] Delete Student Information"
    puts "[3] Exit Student Management"
    puts "======================================================================\n"
    print "\nWhat action would you like to do?: "
    action = gets.chomp

    case action
    when "1"
        add_student
    when "2"
        delete_student
    when "3"
        print "\nAre you sure you want to exit Student Management (y/n)? "
        action = gets.chomp

        if action.downcase == 'y'
            puts "\nEXITING STUDENT MANAGEMENT!"
            break
        end
    else
        puts "Invalid option. Please try again."
    end
end
require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'
require_relative 'course_subject'

# ================================================== STUDENT MANAGEMENT ==================================================
def add_student # ----- Add student -----
    student_id = Student.all.size + 1

    puts "\n=================================================="
    puts "CREATING NEW STUDENT RECORD"

    print "\nEnter Full Name: "
    name = gets.chomp

    print "Birth Date: "
    birth_date = gets.chomp

    print "Enter Email: "
    email = gets.chomp

    print "Enter Phone Number: "
    phone_number = gets.chomp

    if Course.all.empty?
        puts "\nNo courses available. Please add a course first."
        return
    end
    puts "\nPLEASE CHOOSE AN AVAILABLE COURSE:"
    Course.display_all
    print "\nEnter Course ID for the Student: "
    course_id = gets.chomp.to_i

    student = Student.new(student_id, name, birth_date, email, phone_number, course_id)
    student.save

    puts "==================================================\n\n"
    puts "\n#{student.display}"
    puts "\nSTUDENT ADDED SUCCESSFULLY"
end

def delete_student # ----- Delete student -----
    puts "\n=================================================="
    puts "DELETE A STUDENT RECORD"

    print "\nEnter Student ID to delete: "
    id = gets.chomp.to_i
    student = Student.find_by_id(id)

    if student
        puts "\nStudent ID: #{student.id}"
        puts "Name: #{student.name}"
        puts "Birthdate: #{student.birth_date}"
        puts "Email: #{student.email}"
        puts "Phone Number #{student.phone_number}\n"
        puts "=================================================="
        print "\nAre you sure you want to delete? (y/n):  "
        action = gets.chomp

        if action == 'y'
            student.destroy
            puts "\nStudent destroyed successfully.\n"
        end
    else
        puts "\nStudent not found."
    end
end

def student_management
    loop do # ----- Student management -----
        system("clear")
        puts "\n======================================================================"
        puts "Choose a number to correspond to the action you want:"
        puts "[1] Add Student Information"
        puts "[2] Delete Student Information"
        puts "[3] Show all Student Information"
        puts "[4] Exit Student Management"
        puts "======================================================================\n"
        print "\nWhat action would you like to do?: "
        action = gets.chomp
    
        case action
        when "1"
            add_student
        when "2"
            delete_student
        when "3"
            puts "\n==================================================\n"
            puts "STUDENT INFORMATION RECORD\n"
            Student.display_all
        when "4"
            print "\nAre you sure you want to exit Student Management (y/n)? "
            action = gets.chomp
    
            if action == 'y'
                puts "\nEXITING STUDENT MANAGEMENT!"
                break
            end
        else
            puts "\nINVALID OPTION! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"
        end
    end
end

# ================================================== COURSE MANAGEMENT ==================================================
def add_course # ----- Add Course -----
    course_id = Course.all.size + 1

    puts "\n=================================================="
    puts "CREATING NEW COURSE RECORD\n"

    print "Enter Course Name: "
    name = gets.chomp

    course = Course.new(course_id, name)
    course.save

    puts "=================================================="
    puts "\n#{course.display}"
    puts "\nCOURSE ADDED SUCCESSFULLY!"
end

def delete_course # ----- Delete course -----
    puts "\n=================================================="
    print "Enter Course ID to delete: "
    id = gets.chomp.to_i
    course = Course.find_by_id(id)

    if course
        puts "\nCourse ID: #{course.id}"
        puts "Course Name: #{course.name}"
        puts "=================================================="
        print "\nAre you sure you want to delete? (y/n):  "
        action = gets.chomp

        if action == 'y'
            course.destroy
            print "\nCourse destroyed successfully!\n"
        end
    else
        puts "\nCourse not found!"
    end
end

def bind_subject_to_course # ----- Bind subject to course -----
    if Course.all.empty?
        puts "No courses available. Please add a course first."
        return
    end

    puts "Select a Course ID: "
    Course.display_all
    course_id = gets.chomp.to_i

    puts "Select a Subject ID to bind to Course: "
    Subject.display_all
    subject_id = gets.chomp.to_i

    course_subject = CourseSubject.new(CourseSubject.all.size + 1, course_id, subject_id)
    course_subject.save

    puts "Subject bound to course successfully!"
end

def remove_subject_from_course
    puts "Select a Course ID: "
    Course.display_all
    course_id = gets.chomp.to_i

    puts "Select a Subject ID to remove from the Course: "
    course_subjects = CourseSubject.all.select { |cs| cs.course_id == course_id }
    
    if course_subjects.empty?
        puts "No subjects found for this course."
        return
    end

    course_subjects.each { |cs| puts "Subject ID: #{cs.subject_id}" }
    subject_id = gets.chomp.to_i

    course_subject = CourseSubject.all.find { |cs| cs.course_id == course_id && cs.subject_id == subject_id }
    
    if course_subject
        course_subject.destroy
        puts "Subject removed from the course successfully!"
    else
        puts "Subject not found for this course."
    end
end

def course_management
    loop do # ----- Course management -----
        system("clear")
        puts "\n======================================================================"
        puts "Choose a number to correspond to the action you want:"
        puts "[1] Add Course Information"
        puts "[2] Delete Course Information"
        puts "[3] Show all Course Information"
        puts "[4] Add Subject to Course"
        puts "[5] Remove Subject from Course"
        puts "[6] Display Course Subjects"
        puts "[7] Exit Course Management"
        puts "======================================================================\n"
        print "\nWhat action would you like to do?: "
        action = gets.chomp
    
        case action
        when "1"
            add_course
        when "2"
            delete_course
        when "3"
            puts "\n==================================================\n"
            puts "COURSE INFORMATION RECORD\n"
            Course.display_all
        when "4"
            bind_subject_to_course
        when "5"
            remove_subject_from_course
        when "6"
            display_course_subjects
        when "7"
            print "\nAre you sure you want to exit Course Management (y/n)? "
            action = gets.chomp
    
            if action == 'y'
                puts "\nEXITING COURSE MANAGEMENT!"
                break
            end
        else
            puts "\nINVALID OPTION! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"
        end
    end
end

# ================================================== SUBJECT MANAGEMENT ==================================================
def add_subject # ----- Add Subject -----
    subject_id = Subject.all.size + 1

    puts "\n=================================================="
    print "CREATING NEW SUBJECT"

    print "\nEnter Subject Name: "
    name = gets.chomp

    subject = Subject.new(id, name)
    subject.save

    puts "=================================================="
    puts "\n#{subject.display}"
    puts "\nSUBJECT ADDED SUCCESSFULLY!"
end

def delete_subject # ----- Delete subject -----
    puts "\n=================================================="
    print "Enter Subject ID to delete: "
    id = gets.chomp.to_i
    subject = Subject.find_by_id(id)

    if subject
        puts "\nSubject ID: #{subject.id}"
        puts "Subject Name: #{subject.name}"
        puts "=================================================="
        print "\nAre you sure you want to delete? (y/n):  "
        action = gets.chomp

        if action == 'y'
            subject.destroy
            print "\nSubject destroyed successfully!\n"
        end
    else
        puts "\nSubject not found!"
    end
end

def subject_management
    loop do # ----- Subject management -----
        system("clear")
        puts "\n======================================================================"
        puts "Choose a number to correspond to the action you want:"
        puts "[1] Add Subject Information"
        puts "[2] Delete Subject Information"
        puts "[3] Show all Subject Information"
        puts "[4] Exit Subject Management"
        puts "======================================================================\n"
        print "\nWhat action would you like to do?: "
        action = gets.chomp
    
        case action
        when "1"
            add_subject
        when "2"
            delete_subject
        when "3"
            puts "\n==================================================\n"
            puts "SUBJECT INFORMATION RECORD\n"
            Subject.display_all
        when "4"
            print "\nAre you sure you want to exit Subject Management (y/n)? "
            action = gets.chomp
    
            if action == 'y'
                puts "\nEXITING SUBJECT MANAGEMENT!"
                break
            end
        else
            puts "\nINVALID OPTION! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"
        end
    end
end


# ================================================== TEACHER MANAGEMENT ==================================================
def add_teacher # ----- Add Teacher -----
    teacher_id = Teacher.all.size + 1

    puts "\n=================================================="
    print "CREATING NEW TEACHER"

    print "\nEnter Full Name: "
    name = gets.chomp

    print "Birth Date: "
    birth_date = gets.chomp

    print "Enter Email: "
    email = gets.chomp

    print "Enter Phone Number: "
    phone_number = gets.chomp

    print "Enter Department: "
    department = gets.chomp

    teacher = Teacher.new(teacher_id, name, birth_date, email, phone_number, department)
    teacher.save

    puts "==================================================\n\n"
    puts teacher.display
    puts "\nTEACHER ADDED SUCCESSFULLY!"
end

def delete_teacher # ----- Delete teacher -----
    puts "\n=================================================="
    puts "DELETE A TEACHER RECORD"

    print "\nEnter Teacher ID to delete: "
    id = gets.chomp.to_i
    teacher = Teacher.find_by_id(id)

    if teacher
        puts "\nTeacher ID: #{teacher.id}"
        puts "Teacher Name: #{teacher.name}"
        puts "=================================================="
        print "\nAre you sure you want to delete? (y/n):  "
        action = gets.chomp

        if action == 'y'
            teacher.destroy
            print "\nTeacher destroyed successfully!\n"
        end
    else
        puts "\nTeacher not found!"
    end
end

def teacher_management
    loop do # ----- Teacher management -----
        system("clear")
        puts "\n======================================================================"
        puts "Choose a number to correspond to the action you want:"
        puts "[1] Add Teacher Information"
        puts "[2] Delete Teacher Information"
        puts "[3] Show all Teacher Information"
        puts "[4] Exit Teacher Management"
        puts "======================================================================\n"
        print "\nWhat action would you like to do?: "
        action = gets.chomp
    
        case action
        when "1"
            add_teacher
        when "2"
            delete_teacher
        when "3"
            puts "\n==================================================\n"
            puts "TEACHER INFORMATION RECORD\n"
            Teacher.display_all
        when "4"
            print "\nAre you sure you want to exit Teacher Management (y/n)? "
            action = gets.chomp
    
            if action == 'y'
                puts "\nEXITING TEACHER MANAGEMENT!"
                break
            end
        else
            puts "\nINVALID OPTION! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"
        end
    end
end

# ================================================== MAIN PROGRAM ==================================================
loop do
    system("clear")
    puts "\n========================================================================================================="
    puts "CHOOSE A NUMBER TO CORRESPOND TO THE ACTION YOU WANT: "
    puts "[1] Student Management"
    puts "[2] Course Management"
    puts '[3] Subject Management'
    puts '[4] Teacher Management'
    puts '[5] Exit the program'
    puts "=========================================================================================================\n"
    print "\nWhat action would you like to do? "
    action = gets.chomp

    case action
    when "1"
        student_management
    when "2"
        course_management
    when "3"
        subject_management
    when "4"
        teacher_management
    when "5"
        print "\nAre you sure you want to exit the program (y/n)? "
        action = gets.chomp

        if action == 'y'
            puts "\nEXITING THE PROGRAM!"
            break
        end
    else
        puts "\nINVALID OPTION! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"
    end
end
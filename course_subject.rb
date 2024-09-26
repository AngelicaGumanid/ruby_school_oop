class CourseSubject
    attr_accessor :id, :course_id, :subject_id
    @@record = []

    def initialize(id, course_id, subject_id)
        @id = id
        @course_id = course_id
        @subject_id = subject_id
    end
    
    def save
        @@record << self
    end

    def destroy
        @@record.delete(self)
    end

    def display
        puts "ID: #{id}, Course ID: #{course_id}, Subject ID: #{subject_id}"
    end

    def self.all
        @@record
    end

    def self.find_by_id(id)
        @@record.find { |course_subject| course_subject.id == id }
    end

    # Method to add a subject to a course
  def self.add_subject_to_course(course_id, subject_id)
    existing_course = Course.find_by_id(course_id) # Ensure this method exists
    existing_subject = Subject.find_by_id(subject_id) # Ensure this method exists

    if existing_course.nil?
      puts "Error: Course ID #{course_id} does not exist!"
      return
    elsif existing_subject.nil?
      puts "Error: Subject ID #{subject_id} does not exist!"
      return
    end

    # Create a new CourseSubject record and save it
    new_record = CourseSubject.new(@@record.length + 1, course_id, subject_id)
    new_record.save
    puts "Subject ID #{subject_id} successfully added to Course ID #{course_id}."
  end

  # Method to remove a subject from a course
  def self.remove_subject_from_course(course_id, subject_id)
    record_to_remove = @@record.find { |cs| cs.course_id == course_id && cs.subject_id == subject_id }

    if record_to_remove.nil?
      puts "Error: Subject ID #{subject_id} is not bound to Course ID #{course_id}!"
      return
    end

    record_to_remove.destroy
    puts "Subject ID #{subject_id} successfully removed from Course ID #{course_id}."
  end
end
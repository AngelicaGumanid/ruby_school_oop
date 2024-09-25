class CourseSubject
    attr_accessor :id, :course_id, subject_id,
    @@record = []

    def initialize(id:, course_id:, subject_id:)
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
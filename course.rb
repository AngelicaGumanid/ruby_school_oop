class Course
  attr_accessor :id, :name, :deleted_at
  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
    @deleted_at = nil
  end

  def save
    existing_course = self.class.find_by_id(self.id)
    if existing_course
      existing_course.name = self.name
      puts "Course updated successfully!"
    else
      @@record << self
      puts "Course added successfully!"
    end
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    print "Course ID: #{id}, Course Name: #{name}"
  end

  def self.display_all
    all.each do |course|
      puts "Course ID: #{course.id}, Course Name: #{course.name}"
    end
  end

  def self.all
    @@record.select { |course| course.deleted_at.nil? }
  end

  def self.find_by_id(id)
    @@record.find { |course| course.id == id}
  end

  def students
    Student.all.select { |student| student.course_id == self.id }
  end

  def subjects
    course_subjects = CourseSubject.all.select { |cs| cs.course_id == self.id }
    course_subjects.map { |cs| Subject.find(cs.subject_id) }
  end
end
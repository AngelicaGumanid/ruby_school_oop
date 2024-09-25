class Course
  attr_accessor :id, :name
  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
  end

  def save
    @@record << self
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
end
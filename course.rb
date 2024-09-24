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
    @@record.delete(self)
  end

  def display
    print "ID: #{id}, Name: #{name}"
  end

  def self.all
    @@record
  end
  
  def self.find_by_id(id)
    @@record.find { |course| course.id == id}
  end
end
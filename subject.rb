class Subject
  attr_accessor :id, :name
  @@record = []

  def initialize(id, name)
    @id = id
    @name = name
  end

  def save
    existing_subject = self.class.find_by_id(self.id)
    if existing_subject
      existing_subject.name = self.name
      puts "Subject updated successfully!"
    else
      @@record << self
      puts "Subject added successfully!"
    end
  end

  def destroy
    self.deleted_at = Time.now
  end

  def display
    print "ID: #{id}, Name: #{name}"
  end

  def self.display_all
    all.each do |subject|
      puts "Subject ID: #{subject.id}, Subject Name: #{subject.name}"
    end
  end

  def self.all
    @@record.select { |subject| subject.deleted_at.nil? }
  end

  def self.find_by_id(id)
    @@record.find { |subject| subject.id == id}
  end
end
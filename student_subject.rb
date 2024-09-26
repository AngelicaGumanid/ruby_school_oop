class StudentSubject
  attr_accessor :id, :student_id, :subject_id
  @@records = []

  def initialize(id, student_id, subject_id)
    @id = id
    @student_id = student_id
    @subject_id = subject_id
  end

  def save
    @@records << self
  end

  def destroy
    @@records.delete(self)
  end

  def display
    "StudentSubject ID: #{id}, Student ID: #{student_id}, Subject ID: #{subject_id}"
  end

  def self.all
    @@records
  end

  def self.find(id)
    @@records.find { |record| record.id == id }
  end
end

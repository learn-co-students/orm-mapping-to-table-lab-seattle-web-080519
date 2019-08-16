class Student
  attr_reader :id
  attr_accessor :name, :grade
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  def self.create_table
    DB[:conn].execute("CREATE TABLE students (id integer primary key, name text, grade integer)")
  end
  def self.drop_table
    DB[:conn].execute("drop table students")
  end
  def save
    DB[:conn].execute("insert into students (name, grade) values (?,?)", self.name, self.grade)
    @id = DB[:conn].execute("select * from students ")[0][0]
  end
  def self.create(hsh)
    student = Student.new(hsh[:name], hsh[:grade])
    student.save
    student
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
end
